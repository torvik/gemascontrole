json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :weight, :value_carat, :user_id
  json.url product_url(product, format: :json)
end
