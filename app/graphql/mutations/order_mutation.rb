module Mutations
  class OrderMutation < BaseMutation
    field :orders, [Types::OrderType], required: true

    def resolve
      currrent_user.orders
    end
  end
end
