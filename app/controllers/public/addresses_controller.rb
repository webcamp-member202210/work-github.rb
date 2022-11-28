class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @addresses = Address.all
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先登録を完了しました"
      redirect_to addresses_path
    else
      flash[:notice] = "配送先登録に失敗しました"
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先住所を変更しました"
      redirect_to addresses_path
    else
      flash[:notice] = "配送先住所変更に失敗しました"
      render :edit
    end
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:customer, :name, :postal_code, :address)
  end
end
