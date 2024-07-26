class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :announcements, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :email, :first_name, :last_name, :cpf_cnpj, :cellphone, presence: true
  validates :email, :cpf_cnpj, uniqueness: true

  validates :first_name, :last_name, :nickname, length: { in: 3..250 }
  validates :cpf_cnpj, :cellphone, format: { with: /\A\d+\Z/, message: I18n.t("activemodel.user.errors.just_allow_numbers") }
end
