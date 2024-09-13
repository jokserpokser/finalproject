class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :cart_id, null: false  # Foreign key to associate with Cart
      t.decimal :total_amount, precision: 10, scale: 2, null: false  # Amount with precision and scale

      t.timestamps
    end
  end
end
