class CreatePaymentSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_schedules do |t|
      t.string :payment_frequency, null: false
      t.decimal :payment_amount, null: false
      t.date :start_date, null: false
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
