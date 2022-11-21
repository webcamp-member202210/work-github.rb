class Admin::ItemsController < ApplicationController
  before_action :admin_signed_in

  def index
    @items = Item.page(params[:page])
  end

  def new
    @genres = Genre.all
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品登録完了しました。"
      redirect_to admin_item_path(@item)
    end
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
    @tax = (@item.price*1.1).floor
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] ="商品詳細を更新しました。"
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id)
  end

  def admin_signed_in
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
end
