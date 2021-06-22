class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_many_attached :images

  with_options presence: true do
    validates :title
    validates :date
    validates :text
    validates :images
  end
end
