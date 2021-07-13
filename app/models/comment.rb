class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :sentence, presence: true
end
