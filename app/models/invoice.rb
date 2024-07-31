class Invoice < ApplicationRecord
  belongs_to :user
  has_many :invoice_items, dependent: :destroy, inverse_of: :invoice
  has_many :payment_schedules, dependent: :destroy, inverse_of: :invoice

  validates :invoice_number, presence: true, uniqueness: true
  validates :client_name, presence: true
end
