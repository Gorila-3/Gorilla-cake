class Order < ApplicationRecord
  enum payment_method: { クレジットカード: 0, 銀行振り込み: 1 }
end
