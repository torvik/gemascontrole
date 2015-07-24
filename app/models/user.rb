class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true

  has_many :products, dependent: :destroy
  has_many :customer, dependent: :destroy
  has_one  :company, dependent: :destroy
  has_many :sales



end
