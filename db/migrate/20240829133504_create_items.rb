class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_description
      t.integer :price

      t.timestamps
    end
  end
end
