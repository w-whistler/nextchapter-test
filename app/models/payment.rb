class Payment < ApplicationRecord
  belongs_to :payment_schedule

  validates :payment_date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
