class Customers::AddressesController < ApplicationController
  def create
    @address = current_customer.addresses.create!(address_params)
    redirect_to customers_addresses_path
  end

  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end

  def edit
    @addresses = current_customer.addresses.find(params[:id])
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    # binding.pry
    @address.update(address_params)
    redirect_to customers_addresses_path
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
