class User < ApplicationRecord
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            length: { maximum: 255 }

  validates :first_name, :last_name,
            presence: true,
            length: { maximum: 255 }
end
