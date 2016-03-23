class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :sale_date
      t.decimal :total_price
      t.string :pay_type
      t.string :status
      t.references :user, index: true
      t.references :customer, index: true

      t.timestamps null: false
    end

  end
end
