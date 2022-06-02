# frozen_string_literal: true

module Blogging
  class ApplicationController < Blogging.parent_controller.constantize
    include FrontendHelpers::LayoutConcern
    include Pagy::Backend

    default_form_builder FrontendHelpers::FormBuilder
  end
end
