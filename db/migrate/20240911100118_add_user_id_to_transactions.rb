class AddUserIdToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transaction_items, :transaction_id, :integer
    add_column :transaction_items, :item_name, :string
    add_column :transaction_items, :item_quantity, :integer
  end
end
