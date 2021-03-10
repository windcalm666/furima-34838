class Item < ApplicationRecord


  with_options presence: true do
    validates :item
    validates :text
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1, message: "Select" }  do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :day_id
  end

  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :day

end
