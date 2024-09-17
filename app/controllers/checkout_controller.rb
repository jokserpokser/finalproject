class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :check_payment_status, only: [:confirmation]

  def show
    @cart = current_user.cart
    @total_amount = @cart.cart_items.sum { |item| item.quantity * item.item.price }
  end

  def process_payment
    @cart = current_user.cart
    @total_amount = @cart.cart_items.sum { |item| item.quantity * item.item.price }
  
    if current_user.balance >= @total_amount && @cart.cart_items.any?
      current_user.update(balance: current_user.balance - @total_amount)
      transaction = Transaction.create(cart_id: @cart.id, user_id: current_user.id, user_email: current_user.email, total_amount: @total_amount)
      transaction_items = @cart.cart_items.map do |item|
        { transaction_id: transaction.id, cart_id: item.cart_id, item_name: item.item.item_name, item_quantity: item.quantity }
      end
      TransactionItem.insert_all(transaction_items)
  
      # Paymongo Logic
      paymongo_service = PaymongoService.new(@total_amount, "Cart payment", "Payment for cart items")
      payment_link = paymongo_service.create_payment_link
  
      Rails.logger.info "Payment Link Response: #{payment_link.inspect}"
  
      # Redirect to the checkout URL if available
      if payment_link && payment_link.dig("data", "attributes", "checkout_url")
        checkout_url = payment_link["data"]["attributes"]["checkout_url"]
        redirect_to checkout_url, allow_other_host: true  # Allow redirect to external URL
      else
        redirect_to checkout_path, notice: "Failed to generate payment link. Please try again."
      end
    else
      redirect_to checkout_path, notice: "Insufficient balance or empty cart."
    end
  end
  

  def confirmation
    session.delete(:payment_successful)
  end

  private

  def check_payment_status
    unless session[:payment_successful]
      redirect_to checkout_path, alert: "You need to complete the payment before proceeding."
    end
  end
end
