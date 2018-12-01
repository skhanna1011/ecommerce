class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_is_admin, except: [:index, :show]
  
  def index
    @notice = "hello"
    @products = Product.all
  end
  def new
      @product = Product.new
  end
  def create
    @product = Product.new(params[:product].permit(:name, :price, :category_id, :description))
    if @product.save
      redirect_to products_path, notice: "Sucessfully created the product"
    else
      render action: "new"
    end
  end
  def show
    @product = Product.find(params[:id])
    
    @cart_line_item = CartLineItem.new
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product].permit(:name, :price, :category_id, :description))
      redirect_to product_path, notice: "Sucessfully updated the product"
    else
      render action: "edit"
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Sucessfully deleted the product"
  end
end