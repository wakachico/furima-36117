class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角の漢字、ひらがな、カタカナを使用してください' } do
    validates :first_name
    validates :family_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角のカタカナを使用してください' } do
    validates :first_name_kana
    validates :family_name_kana
  end
  validates :nickname,         presence: true
  validates :birthday,         presence: true

end
