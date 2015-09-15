class Sale < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products
  belongs_to :customer

  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |sale|
         csv << sale.attributes.values_at(*column_names)
      end
    end
  end

end
