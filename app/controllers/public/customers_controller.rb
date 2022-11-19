class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end
  
  def withdrawal
    @customer = Customer.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会を実行しました"
    redirect_to root_path
  end
end
