class Admin::UserListController < ApplicationController

    def index
        @users = User.where(user_type: "buyer")
    end
end
