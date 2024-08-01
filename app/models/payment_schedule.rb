class PaymentSchedule < ApplicationRecord
  belongs_to :invoice
  has_many :payments, dependent: :destroy, inverse_of: :payment_schedule

  validates :payment_frequency, presence: true, inclusion: { in: %w[weekly bi-weekly monthly bi-monthly] }
  validates :payment_amount, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :start_date, presence: true

  after_save :generate_payments

  def generate_payments
    self.payments.destroy_all

    total_amount = invoice.total_amount
    current_date = start_date
    while total_amount > 0
      payment = payments.build(amount: [payment_amount, total_amount].min, payment_date: current_date)
      payment.save!
      total_amount -= payment.amount
      current_date = next_payment_date(current_date)
    end
  end

  def next_payment_date(current_date)
    case payment_frequency
    when 'weekly'
      current_date + 1.week
    when 'bi-weekly'
      current_date + 2.weeks
    when 'monthly'
      current_date + 1.month
    when 'bi-monthly'
      current_date + 2.months
    end
  end
end
