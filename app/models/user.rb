class User < ApplicationRecord
  has_many :invoices, dependent: :destroy, inverse_of: :user

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            length: { maximum: 255 }

  validates :first_name,
            presence: true,
            length: { maximum: 255 }

  validates :last_name,
            presence: true,
            length: { maximum: 255 }
end
