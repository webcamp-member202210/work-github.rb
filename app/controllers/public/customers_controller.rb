class Public::CustomersController < ApplicationController
  before_action :move_to_signed_in
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
  end

  def withdrawal
    @customer = current_customer
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会を実行しました"
    redirect_to root_path
  end

  def unsubscribe
    @customer = current_customer
  end
  
  private
  
  def move_to_signed_in
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
  end
end
