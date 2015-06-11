json.array!(@sales) do |sale|
  json.extract! sale, :id, :date_sale, :amount, :qtd_itens, :user_id
  json.url sale_url(sale, format: :json)
end
