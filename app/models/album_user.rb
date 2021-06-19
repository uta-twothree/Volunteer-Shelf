class AlbumUser < ApplicationRecord
  belongs_to :album
  belongs_to :user
end
