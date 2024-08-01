class InvoiceItem < ApplicationRecord
  belongs_to :invoice

  validates :description, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :amount, presence: true, numericality: { greater_than: 0 }

  after_save :generate_payments
  after_destroy :generate_payments

  private

  def generate_payments
    invoice.payment_schedule&.generate_payments
  end
end
