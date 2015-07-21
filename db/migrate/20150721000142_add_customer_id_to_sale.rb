class AddCustomerIdToSale < ActiveRecord::Migration
  def change
    add_reference :sales, :customer, index: true
    add_foreign_key :sales, :customers
  end
end
