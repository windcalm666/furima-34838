class Order < ApplicationRecord

  belongs_to :users
  belongs_to :item
  has_one :address
end
