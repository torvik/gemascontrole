class AddValuevToProducts < ActiveRecord::Migration
  def change
    add_column :products, :valuev, :decimal
  end
end
