class Address < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :city, :block
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を「3桁の数値-4桁の数値」の形で入力してください' }
    validates :prefecture, numericality: { other_than: 1 }
    validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: 'を10桁or11桁の数値で入力してください' }
  end

end
