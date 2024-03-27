class Api::BaseApiController < ApplicationController
  respond_to :json
  before_action :process_token
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end

end
