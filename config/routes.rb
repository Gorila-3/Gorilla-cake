Rails.application.routes.draw do
  
  namespace :admins do
    get 'order_details/update'
  end

  namespace :admins do
    get 'orders/index'
  end

  namespace :admins do
    get 'orders/show'
  end

  namespace :admins do
    get 'orders/update'
  end

  namespace :admins do
    get 'customers/show'
  end

  namespace :admins do
    get 'customers/edit'
  end

  namespace :admins do
    get 'customers/update'
  end

  namespace :admins do
    get 'customers/index'
  end

  namespace :admins do
    get 'categories/index'
  end

  namespace :admins do
    get 'categories/create'
  end

  namespace :admins do
    get 'categories/edit'
  end

  namespace :admins do
    get 'categories/update'
  end

  namespace :admins do
    get 'items/index'
  end

  namespace :admins do
    get 'items/show'
  end

  namespace :admins do
    get 'items/create'
  end

  namespace :admins do
    get 'items/new'
  end

  namespace :admins do
    get 'items/edit'
  end

  namespace :admins do
    get 'items/update'
  end

  namespace :customers do
    get 'addresses/create'
  end

  namespace :customers do
    get 'addresses/index'
  end

  namespace :customers do
    get 'addresses/edit'
  end

  namespace :customers do
    get 'addresses/update'
  end

  namespace :customers do
    get 'addresses/destroy'
  end

  namespace :customers do
    get 'orders/new'
  end

  namespace :customers do
    get 'orders/create'
  end

  namespace :customers do
    get 'orders/thanks'
  end

  namespace :customers do
    get 'orders/index'
  end

  namespace :customers do
    get 'orders/show'
  end

  namespace :customers do
    get 'orders/check'
  end

  namespace :customers do
    get 'cart_items/create'
  end

  namespace :customers do
    get 'cart_items/index'
  end

  namespace :customers do
    get 'cart_items/destroy'
  end

  namespace :customers do
    get 'cart_items/all_destroy'
  end

  namespace :customers do
    get 'cart_items/update'
  end

  namespace :customers do
    get 'items/index'
  end

  namespace :customers do
    get 'items/show'
  end

  namespace :customers do
    get 'items/top'
  end

  namespace :customers do
    get 'items/about'
  end

  namespace :customers do
    get 'customers/show'
  end

  namespace :customers do
    get 'customers/out_show'
  end

  namespace :customers do
    get 'customers/out'
  end

  namespace :customers do
    get 'customers/edit'
  end

  namespace :customers do
    get 'customers/update'
  end

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
