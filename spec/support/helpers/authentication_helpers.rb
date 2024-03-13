module AuthenticationHelpers
  def log_in(user)
    if respond_to?(:sign_in)
      sign_in(user)
    else
      login_as(user, scope: :user)
    end
  end

  def login_api(user)
    request.headers['Content-Type'] = 'application/json'
    request.headers['Authorization']= "Bearer #{user.generate_jwt}"
  end
end

