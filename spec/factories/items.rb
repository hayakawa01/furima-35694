FactoryBot.define do
  factory :item do
    name               {'item'}
    detail             {Faker::Lorem.sentence}
    category_id        {2}
    condition_id       {2}
    delivery_charge_id {2}
    prefecture_id      {2}
    delivery_time_id   {2}
    price              {10000}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'),filename:'item-sample.png')
    end
  end
end
