class Customers::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)  #ログインしている会員を
  end

  def out_show
  end

  def out
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    render "edit"
  end
  
   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,
    :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
