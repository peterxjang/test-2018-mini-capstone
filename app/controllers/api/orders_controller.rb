class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    if current_user
      @orders = current_user.orders
      render "index.json.jbuilder"
    else
      render json: []
    end
  end

  def create
    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    order.save
    render json: order.as_json
  end
end
