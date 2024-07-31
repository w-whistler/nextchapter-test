class CreateInvoiceItems < ActiveRecord::Migration[7.1]
  def change
    create_table :invoice_items do |t|
      t.string :description, null: false
      t.integer :quantity, null: false
      t.decimal :amount, null: false
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
