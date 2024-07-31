class PaymentSchedule < ApplicationRecord
  belongs_to :invoice
end
