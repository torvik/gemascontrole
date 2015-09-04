class AddTamanhoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :tamanho, :decimal
  end
end
