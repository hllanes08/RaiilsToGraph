class Api::OrdersController < Api::BaseApiController 
  def index
    render json: {
      success: true,
      orders: current_user.orders.map(&:to_json)
    }
  end
end
