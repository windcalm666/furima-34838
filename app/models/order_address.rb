class OrderAddress
  include ActiveModel::Model
  attr_accesor :postal_cord, :prefecture_id, :city, :address, :building_name, :phone_number,  :user_id, :item_id
end