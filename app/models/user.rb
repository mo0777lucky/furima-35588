class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :nickname,:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :birthday, presence: true

 #has_many :items
 #has_many :purchase_records

 validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be full-width character' }
 validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be full-width character' }
 validates :last_name_kana, format: { with: /\A[ァ-ヶ一-]+\z/, message: 'must be full-width katakana' }
 validates :first_name_kana, format: { with: /\A[ァ-ヶ一-]+\z/, message: 'must be full-width katakana' }
 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 validates_format_of :password, with: PASSWORD_REGEX, message: 'must be alphanumeric character' 
end
