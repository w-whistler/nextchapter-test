class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.string :invoice_number, null: false
      t.string :client_name, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :invoices, :invoice_number, unique: true
  end
end
