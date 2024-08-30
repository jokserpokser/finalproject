class RemoveAccountStatusFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :account_status, :string
  end
end
