# frozen_string_literal: true

module Blogging
  module Admin
    class BaseController < ApplicationController
      include Pundit::Authorization

      after_action :verify_authorized

      rescue_from Pundit::NotAuthorizedError, with: :not_authorized

      private

      def not_authorized
        redirect_to request.referer || root_path, alert: t('not_authorized')
      end
    end
  end
end
