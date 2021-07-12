class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :item_id, :user_id, :city, :block
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を「3桁の数値-4桁の数値」の形で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: 'を10桁or11桁の数値で入力してください' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end

end