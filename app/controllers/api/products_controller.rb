class Api::ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render "all_products.json.jbuilder"
  end

  def one_product_method
    @product = Product.find_by(id: params[:id])
    render "one_product.json.jbuilder"
  end
end
