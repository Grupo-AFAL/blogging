# frozen_string_literal: true

module Blogging
  module PostsHelper
    def post_status_color(status)
      return :info if status.to_sym == :published

      :light
    end
  end
end
