class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :first_name,format:{ with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: "は、全角での入力が必須です" }
    validates :last_name,format:{ with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: "は、全角での入力が必須です" }
    validates :first_name_kana,format:{ with: /\A[ァ-ヶーー]+\z/, message: "は、全角カタカナでの入力が必須です" }
    validates :last_name_kana,format:{ with: /\A[ァ-ヶーー]+\z/, message: "は、全角カタカナでの入力が必須です" }
    validates :birth_date
  end
  validates :password,format:{with: /\A[a-z\d]+\z/i, message: "は、半角英数字混合での入力が必須です"}
end
