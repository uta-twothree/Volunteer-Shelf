class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_many_attached :images
end
