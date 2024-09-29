class AddDetailsToTransactionItems < ActiveRecord::Migration[7.1]
  def change
    add_column :transaction_items, :cart_id, :integer
  end
end
