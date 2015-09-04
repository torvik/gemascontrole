class AddFormaToProducts < ActiveRecord::Migration
  def change
    add_column :products, :forma, :string
  end
end
