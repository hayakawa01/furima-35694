class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true
  PASSWORD_REGEX = /\A[a-z\d]+\z/i
  validates_format_of :password,{with: PASSWORD_REGEX,message: "は、半角英数字混合での入力が必須です"}
  FULL_NAME_REGEX = /\A[ぁ-んァ-ヶー-龥々ー]+\z/
  validates_format_of :first_name,:last_name,:first_name_kana,:last_name_kana,{with: FULL_NAME_REGEX,message: "は、全角での入力が必須です"}
end
