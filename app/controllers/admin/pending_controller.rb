class Admin::PendingController < ApplicationController
  def index
    @pending_users = User.where(account_status: 'pending')
    @pending_users = @pending_users.where(user_type: 'buyer')
  end

  def approve
    @pending_user = User.find(params[:id])
    if @pending_user.update(account_status: 'approved')
      redirect_to admin_pending_path, notice: 'User was successfully approved.'
    else
      redirect_to admin_pending_path, notice: 'Failed to approve user.'
    end
  end 

end
