FactoryBot.define do
  factory :album do
    name                  { Faker::Name.initials(number: 2) }
    content               { Faker::Lorem.sentence }
    area_id               { 2 }
    theme_id              { 2 }
  end
end
