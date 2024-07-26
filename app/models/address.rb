class Address < ApplicationRecord
  belongs_to :user

  validates :city, :neighborhood, :state, :street, :zip_code, presence: true
  validates :city, :state, length: { in: 3..35 }
  validates :street, length: { in: 3..125 }
  validates :zip_code, length: { is: 8 }, format: { with: /\A\d+\Z/, message: I18n.t("activemodel.user.errors.just_allow_numbers") }
end
