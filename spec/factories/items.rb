FactoryBot.define do
  factory :item do
    association :user
    item {Faker::Game.title}
    text {Faker::Lorem.word}
    price {Faker::Number.between(from: 300, to: 9999999)}
    category_id {Faker::Number.between(from: 2, to: 11)}
    status_id {Faker::Number.between(from: 2, to: 7)}
    charge_id {Faker::Number.between(from: 2, to: 3)}
    day_id {Faker::Number.between(from: 2, to: 4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
