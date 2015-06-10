class AddUserIdToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :user, index: true
    add_foreign_key :companies, :users
  end
end
