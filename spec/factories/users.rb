FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    area_id               { 2 }
    theme_id              { 2 }
    self_introduction     { 'これは自己紹介文です。' }
    birthday              { '2020-01-01' }
  end
end