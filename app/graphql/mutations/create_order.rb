module Mutations
  class CreateOrder < BaseMutation
    argument :article_id, Integer, required: true
    argument :total, Float, required: true
    argument :quantity, Integer, required: true
    
    field :order, Types::OrderType#, null: true
    field :errors, [String]#, null: false

    def resolve(total: , quantity: , article_id:)
      if context[:current_user].present? 
        order = Order.new(quantity: quantity, article_id: article_id, total: total)
        order.user_id = context[:current_user].id
        order.save!
         { order: order, errors: [] }
      else
        { order: nil, errors: ['Unauthorized'] }
      end
    end
  end
end
