class Item < ApplicationRecord
  belongs_to :category
  attachment :image
end
