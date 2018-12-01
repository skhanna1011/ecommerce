class CartLineItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart_line_items = CartLineItem.where(user_id: current_user.id)
    @cart_total = 0.0
  end

  def create
    @cart_line_item = CartLineItem.new(params[:cart_line_item].permit(:quantity, :product_id))
    @cart_line_item.user_id = current_user.id
    errors = @cart_line_item.save_and_update
    if errors.empty?
      redirect_to cart_line_items_path, notice: "Product succesfully added to cart" 
    else
      redirect_to product_path(@cart_line_item.product_id), notice: errors.join(",")
    end
  end

  def update
    @cart_line_item = CartLineItem.find(params[:id])
    if @cart_line_item.update_attributes(params[:cart_line_item].permit(:quantity))
      redirect_to cart_line_items_path, notice: "Quantity updated sucessfully"
    else
      redirect_to cart_line_items_path, notice: "Couldn't update the quantity"
    end
  end

  def destroy
    @cart_line_item = CartLineItem.find(params[:id])
    if @cart_line_item.destroy
      redirect_to cart_line_items_path, notice:"Product sucessfully removed from cart"
    else
      redirect_to cart_line_items_path, notice:"Couldn't delete the item from the cart"
    end
  end

end
