FactoryBot.define do
  factory :user do
    password { '111aaa' }
    password_confirmation { password }
    family_name { '稲葉' }
    first_name { '浩志' }
    nickname { 'ビーズボーカル' }
    email { Faker::Internet.free_email }
    family_name_furigana { 'イナバ' }
    first_name_furigana { 'コウシ' }
    birthday { '2000-02-20' }
  end
end
