class ApplicationController < ActionController::Base
  #before_action :authenticate_user!

  def process_token
    if request.headers['Authorization'].present?
      begin 
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],  Rails.application.secrets.secret_key_base).first
        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        #head :unauthorized
        @current_user_id = nil
      end
    end
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end
end
