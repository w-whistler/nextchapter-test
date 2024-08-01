class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.integer :invoice_number, null: false
      t.string :client_name, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
