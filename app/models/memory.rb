class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_many_attached :images

  with_options presence: true do
    validates :title
    validates :text
    validates :date
    validates :images
  end
end
