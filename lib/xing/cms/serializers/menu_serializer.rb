module Xing
  module Cms
    class MenuSerializer < ::Xing::Serializers::Base

      def as_json(options={})
        root = ::Xing::Services::JsonTreeLister.new(object.tree, MenuNodeSerializer).render
        root["links"] = links
        root
      end

      def links
        {
          :self => routes.menu_path(object),
        }
      end
    end
  end
end
