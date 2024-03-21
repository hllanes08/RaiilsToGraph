# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
     field :login, mutation: Mutations::UserLogin 
  end
end
