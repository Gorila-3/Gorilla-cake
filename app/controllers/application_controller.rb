class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_items_path  #仮パス(正admins_orders_path)
    when User
      root_path
    end
  end  
  
  
end
