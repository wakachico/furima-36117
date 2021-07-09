class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time
  has_one_attached :image

  validates :name,         presence: true
  validates :text,         presence: true
  validates :selling_price,presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :prefencture_id, numericality: { other_than: 1 }
  validates :shipping_time_id, numericality: { other_than: 1 }
  
end
