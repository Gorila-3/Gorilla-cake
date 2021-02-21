
class Order < ApplicationRecord
  enum payment_method: {クレジットカード: 0, 銀行振り込み: 1}
  enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details

  def order_detail_status_auto_update
    if self.status == "入金確認"
      self.order_details.each do |order_detail|
        order_detail.update_attributes(making_status: "制作待ち")
      end
    elsif self.status == "入金待ち"
      self.order_details.each do |order_detail|
        order_detail.update_attributes(making_status: "制作不可")
      end
    end
  end
end


