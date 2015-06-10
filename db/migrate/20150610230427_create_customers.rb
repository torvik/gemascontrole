class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :telefone_1
      t.string :telefone_2
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :customers, :users
  end
end
