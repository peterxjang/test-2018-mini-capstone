class Client::OrdersController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/orders")
    @orders = response.body
    render "index.html.erb"
  end

  def create
    response = Unirest.post("http://localhost:3000/api/orders", parameters: {
      product_id: params[:product_id],
      quantity: params[:quantity]
    })
    redirect_to "/client/orders"
  end
end
