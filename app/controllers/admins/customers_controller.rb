class Admins::CustomersController < ApplicationController
 
  def show
  end

  def edit
  end

  def update
  end

  def index
    @customers = Customer.all
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :email)
  end
end
