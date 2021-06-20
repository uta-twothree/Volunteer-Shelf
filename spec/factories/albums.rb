FactoryBot.define do
  factory :album do
    name                  { Faker::Name.initials(number: 2) }
    content               { Faker::Lorem.sentence }
    area_id               { 2 }
    theme_id              { 2 }

    after(:build) do |album|
      album.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
