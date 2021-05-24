class OrderAddress
  attr_accessor :token

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code,format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is valid. Include hyphen(-)" }
    validates :prefecture_id, numericality:{other_than: 1}
    validates :municipality
    validates :house_number
    validates :phone_number,length:{is: 11},format:{with: /\A[0-9]{11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,municipality: municipality,house_number: house_number,building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end