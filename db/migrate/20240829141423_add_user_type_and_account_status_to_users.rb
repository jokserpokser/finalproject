class AddUserTypeAndAccountStatusToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_type, :string, default: 'buyer'
    add_column :users, :account_status, :string, default: 'pending'
  end
end
