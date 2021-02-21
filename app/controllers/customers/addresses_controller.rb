class Customers::AddressesController < ApplicationController
  before_action :authenticate_customer
  
  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      redirect_to customers_addresses_path
    else
      @addresses = current_customer.addresses.all
      render 'index'
    end
  end

  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    # binding.pry
    if @address.update(address_params)
      redirect_to customers_addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    @addresses = current_customer.addresses.find(params[:id])
    @addresses.destroy
    redirect_to customers_addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end
end
