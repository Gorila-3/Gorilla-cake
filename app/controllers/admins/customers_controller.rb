class Admins::CustomersController < ApplicationController
  before_action :admin
 
  def show
  end

  def edit
  end

  def update
  end

  def index
    @customers = Customer.all
  end
end
