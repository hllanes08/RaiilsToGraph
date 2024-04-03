module Mutations
  class CreateOrder < BaseMutation
    field :article_id, Integer
    field :total, Float
    field :quantity, Integer

    def resolve(total: , quantity: , :article_id)
    end
  end
end
