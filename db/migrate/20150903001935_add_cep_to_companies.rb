class AddCepToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :cep, :string
  end
end
