class CreateSubscribers < ActiveRecord::Migration[8.1]
  def change
    create_table :subscribers do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone
      t.date :next_payment, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end