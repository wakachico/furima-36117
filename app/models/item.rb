class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time
  
  with_options presence: true do
    validates :name, :text, :image
    validates :selling_price,  numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_time_id
  end
  
end
