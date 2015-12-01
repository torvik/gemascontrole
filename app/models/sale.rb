class Sale < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products
  belongs_to :customer

  # def self.to_csv
  #   attributes = %w(id date_sale amount qtd_itens )
  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes
  #     all.each do |sale|
  #       csv << attributes.map{ |attr| sale.send(attr) }
  #     end
  #   end
  # end


end
