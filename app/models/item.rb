class Item < ApplicationRecord
 has_many :cart_items, dependent: :destroy
 belongs_to :category, dependent: :destroy
 attachment :image
end
