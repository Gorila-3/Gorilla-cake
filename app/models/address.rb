class Address < ApplicationRecord
    belongs_to :customers, optional: true


     def order_address
       self.postal_code + self.address + self.name
       
     end
end
