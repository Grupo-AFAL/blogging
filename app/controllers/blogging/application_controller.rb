# frozen_string_literal: true

module Blogging
  class ApplicationController < Blogging.parent_controller.constantize
    include Bali::LayoutConcern
    include Pagy::Backend

    layout Blogging.public_layout if Blogging.public_layout

    default_form_builder FrontendHelpers::FormBuilder
  end
end
