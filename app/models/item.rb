class Item < ApplicationRecord
  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_time
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    with_options numericality: { other_than: 1 } do
      validates :category
      validates :condition
      validates :delivery_charge
      validates :prefecture
      validates :delivery_time     
    end
    validates :price,numericality:{greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999},format:{with: /\A[0-9]+\z/,massage: "は、半角数字で入力してください"}
  end

end
