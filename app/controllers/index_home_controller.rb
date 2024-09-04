class IndexHomeController < ApplicationController
  def index
    @items = Item.all
  end
end
