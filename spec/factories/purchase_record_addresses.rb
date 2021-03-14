FactoryBot.define do
  factory :purchase_record_address do
    postal_code { '123-4567' }
    area_id { 2 }
    municipality { '極寒市' }
    house_number { '1-1' }
    phone_number { '09012345678' }
    purchase_record_id { 1 }
    user_id { 1 }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
