class Address < ApplicationRecord
    belongs_to :customers, optional: true
    # validates :name, presence: true
    # validates :postal_code, length: {is: 7}, presence: true
    # validates :address, presence: true
end
