module AuthenticationHelpers
  def log_in(user)
    if respond_to?(:sign_in)
      sign_in(user)
    else
      login_as(user, scope: :user)
    end
  end

  def login_api(user)
    request.hedaers['Content-Type'] = 'application/json'
    request.headers['Authorization']= "Bearer #{user.generate_jwt}"
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :request
  # If you're using Devise with Rails system tests, you might also want to include:
  config.include Devise::Test::IntegrationHelpers, type: :system
end
