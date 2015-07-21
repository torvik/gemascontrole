class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :sales

  validates :name, :email, presence: true

end
