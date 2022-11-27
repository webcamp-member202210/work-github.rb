class Public::CustomersController < ApplicationController
  before_action :move_to_signed_in

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_show_path
    else
      render :edit
    end
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会を実行しました"
    redirect_to root_path
  end

  def unsubscribe
    @customer = current_customer
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted, :password, :password_confirmation)
  end

  def move_to_signed_in
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
  end
end
