require 'faker'
Article.delete_all
User.delete_all
Order.delete_all
#Create articles
100.times{
 Article.create(
   name: Faker::Commerce.product_name,
   price: Faker::Commerce.price,
   brand: Faker::Commerce.brand,
   stock: rand(1..1000)
 )
}

#Create users
50.times {
  password = SecureRandom::hex(15)
  User.create(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
  )
}

#Create orders for users
article_ids = Article.all.map(&:id)
User.all.each do |user|
  (1..rand(1..5)).each do |index|
    article = Article.find(article_ids.sample)

    quantity = rand(1..10)
    Order.create(
      article_id: article.id,
      quantity: quantity,
      user_id: user.id,
      total: quantity * article.price
    )
  end
end
