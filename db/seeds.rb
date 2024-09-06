# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password123'
  user.user_type = 'admin'
  user.name = 'Admin User'
  user.contact_number = '1234567890'
  user.address = '123 Admin Street, Admin City, Admin Country'
end

# Create example items if they don't already exist
items = [
  { item_name: 'Product A', item_description: 'Description of Product A', price: 100 },
  { item_name: 'Product B', item_description: 'Description of Product B', price: 150 },
  { item_name: 'Product C', item_description: 'Description of Product C', price: 200 }
]

items.each do |item_attrs|
  Item.find_or_create_by!(item_name: item_attrs[:item_name]) do |item|
    item.item_description = item_attrs[:item_description]
    item.price = item_attrs[:price]
  end
end