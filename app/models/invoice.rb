class Invoice < ApplicationRecord
  belongs_to :user
  has_many :invoice_items, dependent: :destroy, inverse_of: :invoice
  has_one :payment_schedule, dependent: :destroy, inverse_of: :invoice

  accepts_nested_attributes_for :payment_schedule

  validates :invoice_number, presence: true
  validates :client_name, presence: true

  def total_amount
    invoice_items.sum(:amount)
  end
end
