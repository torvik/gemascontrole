class Company < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :user_id, message: ':: Voce já tem uma Empresa cadastrada. Edite ou delete a empresa cadastrada previamente'

end
