FactoryBot.define do
  factory :order_address do
    postal_code    {'123-4567'}
    prefecture_id  {2}
    municipality   {'〇〇市■■町'}
    house_number   {'1の2番地'}
    building_name  {'メゾン◯◯'}
    phone_number   {'09012345678'}
    user_id        {1}
    item_id        {1}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
