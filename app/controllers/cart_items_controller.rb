class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item, params[:quantity])

    if @cart.save
      redirect_to cart_path, notice: "#{item.item_name} has been added to your cart."
    else
      redirect_to items_path, alert: "Unable to add item to cart."
    end
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(user: current_user) # Assuming a logged-in user
  end
end
