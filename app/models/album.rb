class Album < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :theme

  belongs_to :user
  has_one_attached :image
  has_many :memories
  has_many :comments

  with_options presence: true do
    validates :name
    validates :content
    validates :image
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :area_id
      validates :theme_id
    end
  end
end
