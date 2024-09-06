class Item < ApplicationRecord
    validates :item_name, presence: true, length: { maximum: 100 }
  
    validates :item_description, presence: true, length: { minimum: 10, maximum: 500 }
  
    validates :price, presence: true, numericality: { greater_than: 0 }

  end
  