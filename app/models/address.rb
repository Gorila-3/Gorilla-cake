class Address < ApplicationRecord
    belongs_to :customers, optional: true

    #new にて使用
     def order_address
      self.postal_code + self.address + self.name
     end
end
