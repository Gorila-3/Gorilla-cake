class Item < ApplicationRecord
 has_many :cart_items, dependent: :destroy
 has_many :order_details
 has_many :orders, through: :order_details
 belongs_to :category
 attachment :image
end
