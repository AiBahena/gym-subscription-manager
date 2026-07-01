class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments do |t|
      t.references :subscriber, null: false, foreign_key: true
      t.decimal :amount
      t.date :payment_date, null: false
      t.string :notes

      t.timestamps
    end
  end
end
