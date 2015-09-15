class Product < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :sales

  validates :name, :user_id, presence: true
  validates :price, :valuev, :value_carat, :tamanho, numericality: { :greater_than_or_equal_to => 0.01 },
                    presence: true

  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |product|
         csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def nome_quantidade
      "#{@product.name} #{@product.quantity}"
  end




end
