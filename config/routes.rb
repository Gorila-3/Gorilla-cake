Rails.application.routes.draw do


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

namespace :admins do
  resources :items, only: [:index, :show, :edit, :create, :update, :new]
  resources :categories, only: [:index, :edit, :create, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:index, :show, :update]
  resources :order_details, only: [:update]
  patch '/admins/id'
end

namespace :customers do
  resource :customers, only: [:show, :edit, :update]
  patch 'customers/out' => 'customers#out', as: :customers_out
  get 'customers/out_show' => 'customers#out_show'
  resources :items, only: [:show, :index]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items' => 'cart_items#all_destroy'
  resources :orders, only: [:new, :create, :index, :show]
  get 'orders/thanks' => 'orders#thanks'
  get 'orders/check' => 'orders#check'
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
end

root to: 'customers/items#top'
get 'about' => 'customers/items#about'
 
end
