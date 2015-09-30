class ChangeTamanhoTypeInProducts < ActiveRecord::Migration
  def change
    change_column :products, :tamanho, :string
  end
end
