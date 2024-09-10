class AddTotalPriceToCartItems < ActiveRecord::Migration[7.1]
  def change
    add_column :cart_items, :total_price, :decimal
  end
end
