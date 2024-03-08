require 'rails_helper'
require 'faker'

RSpec.describe Api::OrdersController, type: :controller do
  context "Create and get orders" do

    let (:password) { SecureRandom::hex(15) } 
    let (:user) { User.create(email: Faker::Internet.email, password: password, password_confirmation: password) }

    before(:each) do
     login_api(user)

    end

    it "get orders" do
      get :index
      expect(response).to be_successful
    end
  end

end
