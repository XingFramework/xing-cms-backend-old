module Xing
  module Cms
    class Engine < ::Rails::Engine
      isolate_namespace Xing::Cms

      config.autoload_paths += Dir[File.join(__FILE__, '../controllers/**/')]

      config.generators do |g|
        g.test_framework :rspec
      end

    end
  end
end
