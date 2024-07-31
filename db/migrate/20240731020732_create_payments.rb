class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.date :payment_date, null: false
      t.decimal :amount, null: false
      t.references :payment_schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
