# frozen_string_literal: true

module Blogging
  module Admin
    class BaseController < Blogging.parent_admin_controller.constantize
      include Pundit::Authorization

      after_action :verify_authorized

      self.conditional_layout = Blogging.admin_layout.to_s

      rescue_from Pundit::NotAuthorizedError, with: :not_authorized

      private

      def not_authorized
        redirect_to request.referer || root_path, alert: t('not_authorized')
      end
    end
  end
end
