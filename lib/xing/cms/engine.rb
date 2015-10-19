module Xing
  module Cms
    class Engine < ::Rails::Engine
      isolate_namespace Xing::Cms

      config.autoload_paths += Dir[File.join(__FILE__, '../controllers/**/')]
      config.autoload_paths += Dir[File.join(__FILE__, '../mappers/**/')]
      config.autoload_paths += Dir[File.join(__FILE__, '../models/**/')]
      config.autoload_paths += Dir[File.join(__FILE__, '../serializers/**/')]
      config.autoload_paths += Dir[File.join(__FILE__, '../uploaders/**/')]
      config.autoload_paths += Dir[File.join(__FILE__, '../observers/**/')]

      config.generators do |g|
        g.test_framework :rspec
      end

    end
  end
end
