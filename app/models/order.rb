class Order < ApplicationRecord
  enum payment_method: { "クレジットカード": 0, "銀行振込み": 1 }

  belongs_to :customer

  has_many :order_details
  has_many :items, through: :order_details
end
