class Item < ApplicationRecord
 
  with_options presence: true do
    validates :item
    validates :text
    validates :price
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :days_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :day
end
