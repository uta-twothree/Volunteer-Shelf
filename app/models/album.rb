class Album < ApplicationRecord
  has_many :users, through: :album_users
  has_many :album_users
end
