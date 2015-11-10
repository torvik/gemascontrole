class RemoveValueCaratFromProducts < ActiveRecord::Migration
  def change
     remove_column :products, :value_carat, :decimal
  end
end
