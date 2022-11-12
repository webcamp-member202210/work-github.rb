class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
  end

  def create
    @item = Item.new(item_params)
  end

  private


end
