class Customers::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)  #ログインしている会員を
  end

  def out_show
  end

  def out
  end

  def edit
  end

  def update
  end
end
