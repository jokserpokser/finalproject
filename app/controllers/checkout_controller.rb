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

    if current_user.balance >= @total_amount
      current_user.update(balance: current_user.balance - @total_amount)
      transaction = Transaction.create(cart_id: @cart.id, user_id: current_user.id, total_amount: @total_amount)
      transaction_items = @cart.cart_items.map do |item|
        { transaction_id: transaction.id, cart_id: item.cart_id, item_name: item.item.item_name, item_quantity: item.quantity }
      end
      TransactionItem.insert_all(transaction_items)
      # Paymongo Logic
      payment_successful = true # Simulate payment success, replace with real logic
    end

    if payment_successful
      session[:payment_successful] = true # Store the success flag in the session
      @cart.cart_items.destroy_all # Clear cart after payment
      redirect_to confirmation_path
    else
      redirect_to checkout_path, notice: "Payment failed. Please try again."
    end
  end

  def confirmation
    # This will only be called if the payment was successful
    session.delete(:payment_successful)
  end

  private

  def check_payment_status
    # Check if the payment was successful before accessing the confirmation page
    unless session[:payment_successful]
      redirect_to checkout_path, alert: "You need to complete the payment before proceeding."
    end
  end
end
