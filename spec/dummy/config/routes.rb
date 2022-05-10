# frozen_string_literal: true

Rails.application.routes.draw do
  mount Blogging::Engine => '/blogging'
end
