FactoryBot.define do
  factory :item do
    name { 'ソルティガ' }
    text { Faker::Lorem.sentence }
    category_id { 2 }
    state_id { 2 }
    delivery_fee_id { 2 }
    area_id { 2 }
    days_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
