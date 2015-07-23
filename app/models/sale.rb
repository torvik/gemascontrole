class Sale < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products
  belongs_to :customer

  def atualiza_estoque
     if @sales == @products_sales
      if @products_sales == @product
        #@product.quantity = @product.quantity - @sales.qtd_itens
        #@product.decrement!(:quantity)
      end
    end
  end

end
