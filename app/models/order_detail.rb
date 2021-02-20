class OrderDetail < ApplicationRecord
  enum making_status: {制作不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3}
  belongs_to :item
  belongs_to :order


  def order_status_auto_update
    if self.making_status == "製作中"
      self.order.update_attributes(status: "製作中")
    end
  end
  
  def making_complete_auto_update
    @order = self.order
    @order_details = @order.order_details
    @maikng_status = @order_details.pluck(:making_status)
     if @maikng_status.all?{ |making_status| making_status == "制作完了"}
       @order.update_attributes(status: "発送準備中")
     end
  end

end