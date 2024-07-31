class PaymentSchedule < ApplicationRecord
  belongs_to :invoice

  validates :payment_frequency, presence: true, inclusion: { in: %w[weekly bi-weekly monthly bi-monthly] }
  validates :payment_amount, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :start_date, presence: true
end
