# frozen_string_literal: true

module Blogging
  module ApplicationHelper
    include PostsHelper

    def icon_tag(icon, **)
      render Bali::Icon::Component.new(icon, **)
    end
  end
end
