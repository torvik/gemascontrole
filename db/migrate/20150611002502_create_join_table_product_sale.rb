class CreateJoinTableProductSale < ActiveRecord::Migration
  def change
    create_join_table :products, :sales do |t|
      # t.index [:product_id, :sale_id]
      # t.index [:sale_id, :product_id]
    end
  end
end
