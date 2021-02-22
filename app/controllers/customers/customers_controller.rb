class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer
  def show
    @customer = Customer.find(current_customer.id)  #ログインしている会員を
  end

  def out_show
    @customer = Customer.find(current_customer.id)
  end

  def out
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: "true")
    # binding.pry
    reset_session
    redirect_to root_path
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to customers_customers_path
    else
      render 'edit'
    end
  
  end
  
   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,:first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end
