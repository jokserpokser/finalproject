class CartItemsController < ApplicationController
  before_action :set_cart, :set_cart_item

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item, params[:quantity])

    if @cart.save
      redirect_to cart_path, notice: "#{item.item_name} has been added to your cart."
    else
      redirect_to items_path, alert: "Unable to add item to cart."
    end
  end

  def increase
    if @cart_item
      @cart_item.quantity += 1
      @cart_item.total_price = @cart_item.quantity * @cart_item.item.price

      if @cart_item.save
        redirect_to cart_path, notice: "Item quantity increased."
      else
        redirect_to cart_path, notice: "Failed to update item quantity."
      end
    else
      redirect_to cart_path, notice: "Item not found in cart."
    end
  end

  def decrease
    if @cart_item
      @cart_item.quantity > 1
      @cart_item.quantity -= 1
      @cart_item.total_price = @cart_item.quantity * @cart_item.item.price

      if @cart_item.save
        redirect_to cart_path, notice: "Item quantity increased."
      else
        redirect_to cart_path, notice: "Failed to update item quantity."
      end
    else
      redirect_to cart_path, notice: "Item not found in cart."
    end
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(user: current_user)
  end

  def set_cart_item
    @cart_item = CartItem.find_by(cart_id: @cart.id, item_id: params[:id])

    unless @cart_item
      Rails.logger.debug "OKSOKS Cart item not found with Cart ID: #{@cart.id}, Item ID: #{params[:item_id]}"
    end
  end

end
