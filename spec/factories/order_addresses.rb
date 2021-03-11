FactoryBot.define do
  factory :order_address do
    postal_cord { "123-4567" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    address {'1-1'}
    building_name { '青山ビルディング' }
    phone_number { "09012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
