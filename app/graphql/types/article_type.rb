module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :price, Float
    field :integer, Integer
    field :stock, Integer

  end
end
