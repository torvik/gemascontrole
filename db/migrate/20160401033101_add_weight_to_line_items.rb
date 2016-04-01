class AddWeightToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :weight, :decimal
  end
end
