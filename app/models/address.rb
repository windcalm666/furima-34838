class Address < ApplicationRecord

  with_options presence: true do
    validates :postal_cord
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :address
    validates :phone_number
  end

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
