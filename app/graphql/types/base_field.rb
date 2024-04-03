# frozen_string_literal: true

module Types
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument

    def authorized?(obj, args, ctx)
      super || (ctx.query.mutation? || ctx[:current_user].present?)
    end
  end
end
