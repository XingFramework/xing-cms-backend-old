require 'xing-backend'
require 'devise_token_auth'


module Xing
  module Cms
    class Admin::AdminController < Xing::Controllers::Base
      before_filter :reject_if_not_logged_in

      def reject_if_not_logged_in
        unless current_user
          render :json => {}, status: 401
        end
      end
    end
  end
end
