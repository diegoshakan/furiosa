class User < ApplicationRecord
  acts_as_paranoid
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :first_name, :last_name, :cpf_cnpj, :cellphone, presence: true
  validates :email, :cpf_cnpj, uniqueness: true
end
