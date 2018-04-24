class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def one_product_method
    @product = Product.find_by(id: params[:id])
    render "one_product.json.jbuilder"
  end
end
