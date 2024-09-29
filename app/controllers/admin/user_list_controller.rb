class Admin::UserListController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :authenticate_admin!
  
    # GET /admin/user_list
    def index
      @users = User.where(user_type: "buyer")
    end
  
    # GET /admin/user_list/new
    def new
      @user = User.new
    end
  
    # POST /admin/user_list
    def create
      @user = User.new(user_params.merge(user_type: "buyer")) # Ensure the user_type is set to "buyer"
      
      if @user.save
        redirect_to admin_user_list_index_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    # GET /admin/user_list/:id/edit
    def edit
    end
  
    # PATCH/PUT /admin/user_list/:id
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      
      if @user.update(user_params)
        redirect_to admin_user_list_index_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /admin/user_list/:id
    def destroy
      @user.destroy
      redirect_to admin_user_list_index_path, notice: 'User was successfully deleted.'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :account_status, :contact_number, :address, :balance) # Add other permitted params as needed
    end
  end
  
