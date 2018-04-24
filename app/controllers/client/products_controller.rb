class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/products")
    @products = response.body
    render 'index.html.erb'
  end

  def new
    render "new.html.erb"    
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    @product.save
    render "create.html.erb"
  end

  def show
    response = Unirest.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.body
    render "show.html.erb"
  end

  def edit
    response = Unirest.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.body
    render "edit.html.erb"
  end

  def update
    response = Unirest.patch("http://localhost:3000/api/products/#{params[:id]}", parameters: params.permit(params.keys).to_h)
    @product = response.body
    render "update.html.erb"
  end

  def destroy
    response = Unirest.delete("http://localhost:3000/api/products/#{params[:id]}")
    render "destroy.html.erb"
  end
end
