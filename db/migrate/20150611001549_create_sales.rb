class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :date_sale
      t.decimal :amount
      t.integer :qtd_itens
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :sales, :users
  end
end
