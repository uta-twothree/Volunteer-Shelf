FactoryBot.define do
  factory :album_user do
    association :user
    association :album
  end
end
