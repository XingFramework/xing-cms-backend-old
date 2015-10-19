require 'xing/cms/serializers/page_serializer'

module Xing
  module Cms
    class Admin::PageSerializer < ::Xing::Cms::PageSerializer
      attributes :url_slug, :published, :publish_start, :publish_end

      def links
        { :self => routes.admin_page_path(object), :public => routes.page_path(object), :admin => routes.admin_page_path(object) }
      end
    end
  end
end
