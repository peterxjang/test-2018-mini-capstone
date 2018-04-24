class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/products")
    @products = response.body
    render 'index.html.erb'
  end

  def show
    response = Unirest.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.body
    render "show.html.erb"
  end
end
