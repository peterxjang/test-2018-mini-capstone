class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("http://localhost:3000/api/products")
    @products = response.body
    render 'index.html.erb'
  end

  def new
    @product = {}
    render "new.html.erb"    
  end

  def create
    response = Unirest.post("http://localhost:3000/api/products", parameters: params.permit(params.keys).to_h)
    if response.code == 200
      @product = response.body
      flash[:success] = "Recipe successfully created!"
      redirect_to "/client/products/#{@product['id']}"
    else
      @product = params
      @product["errors"] = response.body["errors"]
      render "new.html.erb"
    end
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
    flash[:success] = "Recipe successfully updated!"
    redirect_to "/client/products/#{params[:id]}"
  end

  def destroy
    response = Unirest.delete("http://localhost:3000/api/products/#{params[:id]}")
    render "destroy.html.erb"
  end
end
