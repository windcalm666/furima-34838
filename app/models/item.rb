class Item < ApplicationRecord

  validates :item
  validates :text
  validates :price
  validates :category_id
  validates :status_id
  validates :charge_id
  validates :prefecture_id
  validates :days_id

  belongs_to :user
end
