class Api::OrdersController < Api::BaseApiController 
  def index
    render json: {
      success: true,
      orders: current_user.orders.map(&:to_json)
    }
  end

  def create
    order = Order.new(order_params)
    order.user_id = current_user.id
    if order.valid? && order.save!
      render json: {
        success: true,
        order: order
      }
    else
      render json: {
        success: false,
        errors: order.errors.full_messages
      }
    end
  end

  private

  def order_params
    params.require(:order).permit(:article_id, :total, :quantity)
  end
end
