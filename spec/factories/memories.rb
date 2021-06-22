FactoryBot.define do
  factory :memory do
    title                 { Faker::Name.initials(number: 2) }
    text                  { Faker::Lorem.sentence }
    date                  { '2020-01-01' }
    association :user
    association :album

    after(:build) do |memory|
      memory.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
