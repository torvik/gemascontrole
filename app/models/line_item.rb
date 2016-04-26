class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
     #product.valuev * quantity
     if weight.nil?
      0
    else
     product.valuev * weight
    end
  end


end
