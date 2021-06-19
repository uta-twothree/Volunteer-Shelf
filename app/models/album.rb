class Album < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :theme

  has_many :users, through: :album_users
  has_many :album_users

  with_options presence: true do
    validates :name
    validates :content
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :area_id
      validates :theme_id
    end
  end
end
