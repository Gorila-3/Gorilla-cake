class Item < ApplicationRecord
 has_many :cart_items, dependent: :destroy
 belongs_to :category, dependent: :destroy
 belongs_to :customer
 attachment :image
end
