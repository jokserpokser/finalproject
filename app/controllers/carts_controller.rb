class CartsController < ApplicationController
  before_action :authenticate_user!  # Ensure user is logged in before any cart actions

  def add_item
    @cart = current_user.cart
    @item = Item.find(params[:item_id])

    # Add the item to the cart unless it's already included
    unless @cart.items.include?(@item)
      @cart.items << @item
      flash[:notice] = "#{@item.item_name} was added to your cart."
    else
      flash[:alert] = "#{@item.item_name} is already in your cart."
    end

    redirect_to cart_path(@cart)
  end

  def show
    @cart = current_user.cart
    # Additional logic for displaying the cart can be added here
  end
end
