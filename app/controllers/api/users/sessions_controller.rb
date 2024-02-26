class Api::Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token 
  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      token = user.generate_jwt
      render json: token.to_json
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  protected

  def sign_in_params
    params.require(:session).permit(:email, :password, :password_confirmation) 
  end
end
