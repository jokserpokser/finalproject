class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_admin, only: [:edit, :update]

  def admin_only
    redirect_to root_path, alert: 'Access denied' unless current_user&.admin?
  end

  # GET /items or /items.json
  def index
    flash[:notice] = ' '
    @items = Item.all
  end

  def search
    @items = Item.where('item_name LIKE ?', "%#{params[:query]}%")
  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  


  def description
    @item = Item.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:item_name, :item_description, :price)
    end

    def check_admin
      unless current_user.admin?
        redirect_to items_path, alert: "You are not authorized to edit items."
      end
    end
end
