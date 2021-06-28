class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates :text, presence: true
end
