class Customers::AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to customers_addresses_path
  end

  def index
    @address = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.save
    redirect_to customers_addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to edit_customers_address_path
  end
  
  def address_params
    params.permit(:name, :postal_code, :address)
  end
end
