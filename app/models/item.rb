class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time
  

  validates :name,             presence: true
  validates :text,             presence: true
  validates :image,            presence: true
  validates :selling_price,    presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id,      numericality: { other_than: 1 }
  validates :status_id,        numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id,    numericality: { other_than: 1 }
  validates :shipping_time_id, numericality: { other_than: 1 }
  
end
