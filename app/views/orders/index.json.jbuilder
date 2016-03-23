json.array!(@orders) do |order|
  json.extract! order, :id, :sale_date, :total_price, :pay_type, :status, :user_id, :customer_id
  json.url order_url(order, format: :json)
end
