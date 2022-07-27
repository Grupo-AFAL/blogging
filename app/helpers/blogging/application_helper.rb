# frozen_string_literal: true

module Blogging
  module ApplicationHelper
    include Pagy::Frontend

    def icon_tag(icon, **options)
      render Bali::Icon::Component.new(icon, **options)
    end

    def status_color(status)
      return :info if status.to_sym == :published

      :light
    end
  end
end
