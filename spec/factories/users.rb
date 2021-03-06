FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"模範"}
    first_name_read {"モハン"}
    last_name {"試験"}
    last_name_read {"シケン"}
    birthday {Faker::Date.birthday(min_age: 20, max_age: 70)}
  end
end