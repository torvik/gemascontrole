class AddCodigoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :codigo, :string
  end
end
