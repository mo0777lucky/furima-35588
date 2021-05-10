class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :nickname,:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :birthday, presence: true

 has_many :items
 has_many :purchase_records

 validates :last_name_kanji, :first_name_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
 validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶ一-]+\z/, message: '全角文字を使用してください' }
 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
 validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

end
