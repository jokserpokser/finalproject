class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  def calculate_total_price
    self.total_price = quantity * item.price
  end
end
