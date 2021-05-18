FactoryBot.define do
  factory :user do
    nickname
    email
    password
    passeord_confirmation
    first_name
    last_name
    first_name_kana
    last_name_kana
    birth_date
  end
end