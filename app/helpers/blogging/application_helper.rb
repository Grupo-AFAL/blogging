# frozen_string_literal: true

module Blogging
  module ApplicationHelper
    include Pagy::Frontend
    include PostsHelper

    def icon_tag(icon, **options)
      render Bali::Icon::Component.new(icon, **options)
    end
  end
end
