require 'rails_helper'
require 'faker'

RSpec.describe Api::OrdersController, type: :controller do
  include AuthenticationHelpers
  context "Create and get orders" do

    let (:password) { SecureRandom::hex(15) } 
    let (:user) { User.create(email: Faker::Internet.email, password: password, password_confirmation: password) }
    let (:article) { Article.create(name: 'Test', price: 10, brand: 'Test', stock: 10) }
    before(:each) do
     login_api(user)
    end

    it "get orders" do
      get :index
      expect(response).to be_successful
      json_response = JSON.parse(response.body)
      expect(json_response['orders'].size).to eq 0
    end

    it 'create order' do
      post :create, params: {
        order: {
          article_id: article.id,
          total: 100,
          quantity: 5
        }
      }
      expect(response).to be_successful
      json_response = JSON.parse(response.body)
      expect(json_response['order']['id'].present?).to eq true
      get :index
      expect(response).to be_successful
      json_response = JSON.parse(response.body)
      expect(json_response['orders'].size).to eq 1

    end
  end

end
