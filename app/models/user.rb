class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { male: "male", female: "female", not_defined: "not_defined" }

  has_many :announcements, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  validates :first_name, :last_name, :nickname, presence: true
end
