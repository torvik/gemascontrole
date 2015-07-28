class Product < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :sales

  validates :name, :user_id, presence: true
  validates :price, numericality: { :greater_than_or_equal_to => 0.01 },
                    presence: true


  def nome_quantidade
      "#{@product.name} #{@product.quantity}"
  end




end
