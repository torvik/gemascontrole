class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :sales

  validates :name, :email, presence: true

  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |customer|
         csv << customer.attributes.values_at(*column_names)
      end
    end
  end

end
