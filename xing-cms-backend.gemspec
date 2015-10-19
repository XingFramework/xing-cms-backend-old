Gem::Specification.new do |spec|
  spec.name		= "xing-cms-backend"
  #{MAJOR: incompatible}.{MINOR added feature}.{PATCH bugfix}-{LABEL}
  spec.version		= "0.0.1"
  author_list = {
    "Evan Dorn" => 'evan@lrdesign.com'
  }
  spec.authors		= author_list.keys
  spec.email		= spec.authors.map {|name| author_list[name]}
  spec.summary		= "Code generator tools for the Xing Framework."
  spec.description	= <<-EndDescription
    The Xing Framework is a hypermedia-enabled Rails + AngularJS web and mobile development platform.
    This gem contains the generator for initializing a new Xing project.
  EndDescription
  # spec.executables = %w{ xing }

  spec.homepage        = "http://github.com/#{spec.name.downcase}"
  spec.required_rubygems_version = Gem::Requirement.new(">= 0") if spec.respond_to? :required_rubygems_version=

  # Do this: y$ (on line below to yank it)
  #          @" (to execute that as a command, in the spec.files array
  # !!find lib bin doc spec spec_help -not -regex '.*\.sw.' -type f 2>/dev/null
    #
  # On OSX:
  # find -E lib bin doc spec spec_help -not -regex '.*\.(sw.|keep)' -type f  2>/dev/null
  spec.files		= %w[
    lib/version.rb
    lib/xing/cms/controllers/admin/admin_controller.rb
    lib/xing/cms/controllers/admin/blog_posts_controller.rb
    lib/xing/cms/controllers/admin/froala_documents_controller.rb
    lib/xing/cms/controllers/admin/froala_images_controller.rb
    lib/xing/cms/controllers/admin/menu_items_controller.rb
    lib/xing/cms/controllers/admin/pages_controller.rb
    lib/xing/cms/controllers/menus_controller.rb
    lib/xing/cms/controllers/pages_controller.rb
    lib/xing/cms/controllers/topics_controller.rb
    lib/xing/cms/engine.rb
    lib/xing/cms/mappers/content_block_mapper.rb
    lib/xing/cms/mappers/menu_item_mapper.rb
    lib/xing/cms/mappers/menu_mapper.rb
    lib/xing/cms/mappers/page_mapper.rb
    lib/xing/cms/models/content_block.rb
    lib/xing/cms/models/document.rb
    lib/xing/cms/models/image.rb
    lib/xing/cms/models/menu.rb
    lib/xing/cms/models/menu_item.rb
    lib/xing/cms/models/page/homepage.rb
    lib/xing/cms/models/page/one_column.rb
    lib/xing/cms/models/page/two_column.rb
    lib/xing/cms/models/page.rb
    lib/xing/cms/models/page_content.rb
    lib/xing/cms/serializers/admin/menu_item_serializer.rb
    lib/xing/cms/serializers/admin/menu_serializer.rb
    lib/xing/cms/serializers/admin/menus_serializer.rb
    lib/xing/cms/serializers/admin/page_serializer.rb
    lib/xing/cms/serializers/admin/pages_serializer.rb
    lib/xing/cms/serializers/content_block_serializer.rb
    lib/xing/cms/serializers/menu_list_serializer.rb
    lib/xing/cms/serializers/menu_node_serializer.rb
    lib/xing/cms/serializers/menu_serializer.rb
    lib/xing/cms/serializers/page_serializer.rb
    lib/xing/cms/uploaders/doc_uploader.rb
    lib/xing/cms/uploaders/image_uploader.rb
    lib/xing/cms/uploaders/system_uploader.rb
    lib/xing/cms.rb
    lib/xing-cms-backend.rb
    spec/mappers/content_block_mapper_spec.rb
    spec/mappers/menu_item_mapper_spec.rb
    spec/mappers/menu_mapper_spec.rb
    spec/mappers/page_mapper_spec.rb
    spec/null_spec.rb
    spec_help/gem_test_suite.rb
    spec_help/spec_helper.rb
  ]

  spec.licenses = ["MIT"]
  spec.require_paths = %w[lib/]
  spec.rubygems_version = "1.3.5"

  spec.has_rdoc		= true
  spec.extra_rdoc_files = Dir.glob("doc/**/*")
  spec.rdoc_options	= %w{--inline-source }
  spec.rdoc_options	+= %w{--main doc/README }
  spec.rdoc_options	+= ["--title", "#{spec.name}-#{spec.version} Documentation"]

  spec.add_dependency 'xing_backend_token_auth', "~> 0.1.31"
  spec.add_dependency 'xing-backend', "~> 0.0.18"
  spec.add_dependency 'rails', "~> 4.2.1"
  spec.add_dependency 'carrierwave'
  spec.add_dependency 'rmagick'
  spec.add_dependency 'rails-observers'

end
