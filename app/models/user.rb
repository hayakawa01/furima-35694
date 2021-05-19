class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birth_date
    with_options format:{ with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: "は、全角での入力が必須です" } do
      validates :first_name
      validates :last_name
    end
    with_options format:{ with: /\A[ァ-ヶーー]+\z/, message: "は、全角カタカナでの入力が必須です" } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
  validates :password,format:{with: /\A(?=.*[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は、半角英数字混合での入力が必須です"}
end

