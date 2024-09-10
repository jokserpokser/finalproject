class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart || current_user.create_cart
  end

  def add_item
    @cart = current_user.cart || current_user.create_cart
    item = Item.find(params[:item_id])

    # Check if the item already exists in the cart, increase the quantity if so
    cart_item = @cart.cart_items.find_by(item_id: item.id)
    if cart_item
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      @cart.cart_items.create(item: item, quantity: 1)
    end

    # redirect_to cart_path, notice: "#{item.item_name} has been added to your cart."
  end

  def remove_item
    cart_item = CartItem.find(params[:cart_item_id])
    cart_item.destroy

    redirect_to cart_path
  end

end
