class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :theme

  has_many :albums
  has_many :memories
  has_many :comments

  with_options presence: true do
    validates :group_name
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :area_id
      validates :theme_id
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', on: :create
end
