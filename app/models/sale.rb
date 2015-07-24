class Sale < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products
  belongs_to :customer



end
