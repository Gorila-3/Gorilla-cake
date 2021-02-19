class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#↓　会員ログインの際、追加したカラムを許可する記述 
 before_action :customers_configure_permitted_parameters , if: :devise_controller?

 def customers_configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
 end
#　会員ログインの際、追加したカラムを許可する記述 

  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_items_path  #仮パス(正admins_orders_path)
    when Customer
      root_path
    end
  end
  

  
end
