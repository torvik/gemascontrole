json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :email, :endereco, :cidade, :estado, :telefone_1, :telefone_2, :user_id
  json.url customer_url(customer, format: :json)
end
