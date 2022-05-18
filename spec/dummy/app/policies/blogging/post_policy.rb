module Blogging
  class PostPolicy < ApplicationPolicy
    def show?
      true
    end

    def edit?
      true
    end
  end
end