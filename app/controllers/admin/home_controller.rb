module Admin
  class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin!
    def index
      @item_count = ::Item.count
      @transactions_count= Transaction.count
      @users_count = User.where(user_type: "buyer").count
    end
  end
end

