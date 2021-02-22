class Admins::CustomersController < ApplicationController
 before_action :authenticate_admin
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    render "show"
  end

  def index
    @customers = Customer.all
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,
    :first_name_kana, :postal_code, :address, :email, :is_deleted)
  end
end
