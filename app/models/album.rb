class Album < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :theme
  
  has_many :users, through: :album_users
  has_many :album_users
end
