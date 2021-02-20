class Item < ApplicationRecord
 has_many :cart_items, dependent: :destroy
 belongs_to :category
 
 has_many :order_details
 has_many :orders, through: :order_details
 
 attachment :image
 
 
  
  
end
