class Invoice < ApplicationRecord
  belongs_to :user

  validates :invoice_number, presence: true, uniqueness: true
  validates :amount, presence: true
end
