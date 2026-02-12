# frozen_string_literal: true

module Blogging
  module PostsHelper
    def post_status_color(status)
      status.to_sym == :published ? :info : :neutral
    end
  end
end
