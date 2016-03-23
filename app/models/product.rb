class Product < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :sales
  has_many :line_items
  has_many :orders, :through => :line_items

  before_destroy :ensure_not_referenced_by_any_line_item


  validates :name, :user_id, presence: true
  validates :price, :valuev, numericality: { :greater_than_or_equal_to => 0.01 },
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

  def name_and_codigo
    ":: Código: #{codigo} | Nome: #{name} | Forma: #{forma} :: "
  end

  # ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
  if line_items.count.zero?
     return true
  else
  errors[:base] << "Line Items present"
     return false
  end
end





end
