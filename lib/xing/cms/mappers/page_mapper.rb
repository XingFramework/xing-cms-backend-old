module Xing
  module Cms
    class PageMapper < ::Xing::Mappers::Base
      alias page record
      alias page= record=
      attr_accessor :bad_blocks, :page_layout

      def assign_values(data_hash)
        @page_data = data_hash
        self.page_layout = data_hash.delete('layout')
        @block_hash = data_hash.delete('contents')

        super
      end

      def find_existing_record
        page = Page.find_by_url_slug(@locator)
        self.page_layout = page.layout.to_sym
        lookup_page_class
        page
      end

      def build_new_record
        self.page_layout = @source_hash['data']['layout'].to_sym
        lookup_page_class
        @page_class.new
      end

      def lookup_page_class
        @page_class = Page.registry_get(self.page_layout)
      end

      def update_record
        self.page.update_attributes(@page_data)
        self.page.set_url_slug
      end

      def map_nested_models
        return unless @block_hash.present?
        @page_class.content_format.each do |content_block_specifier|
          block_name = content_block_specifier[:name]

          if @block_hash[block_name].present?
            build_content_block(block_name)
          end

          build_nested_errors(content_block_specifier, block_name)

          unless @nested_errors > 0 || @block_data.nil?
            save_content_block(self.page, block_name, unwrap_data(@block_data) )
          end
        end
      end

      def build_content_block(block_name)
        format = self.page.named_content_format(block_name)
        @block_data = @block_hash[block_name]
        @block_data[:data][:content_type] = format[:content_type]
        @cbm = ContentBlockMapper.new(@block_data)
        @cbm.perform_mapping
      end

      def save_content_block(page, block_name, block_data)
        if (content_block = page.contents[block_name]).present?
          update_content_block(content_block, block_data)
        else
          add_content_block(page, block_name, block_data)
        end
        page.sanitize(block_name, page.contents[block_name])
      end

      def update_content_block(content_block, block_data)
        content_block.update_attribute(:body, block_data[:body])
      end

      def add_content_block(page, block_name, block_data)
        page.page_contents << PageContent.new(
          :name => block_name,
          :content_block => ContentBlock.new(
            :content_type => block_data[:content_type],
            :body         => block_data[:body]
          )
        )
      end

      def build_nested_errors(content_block_specifier, block_name)
        @nested_errors = 0
        if content_block_specifier[:required]
          if  @block_hash[block_name].blank?
            error_data[:contents][block_name] = { :data => { :type => "required", :message => "This block is required: #{block_name}"} }
            @nested_errors += 1
          end

          if @cbm && @cbm.content_block.body.blank?
            error_data[:contents][block_name] = { :data => {:body=>{:type=>"required", :message=>"can't be blank"}} }
            @nested_errors += 1
          end
        end
      end
    end
  end
end
