class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :telefone_1
      t.string :telefone_2

      t.timestamps null: false
    end
  end
end
