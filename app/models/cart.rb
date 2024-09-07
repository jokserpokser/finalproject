class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user

  def total_price
    cart_items.joins(:item).sum('cart_items.quantity * items.price')
  end
end
