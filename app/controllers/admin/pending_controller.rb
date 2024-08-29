class Admin::PendingController < ApplicationController
  def index
    @pending_users = User.where(account_status: 'pending')
    @pending_users = @pending_users.where(user_type: 'buyer')
  end
end
