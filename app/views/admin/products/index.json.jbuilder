json.array!(@products) do |product|
  json.extract! product, :id, :name, :prise, :discription, :category_id, :category_id
  json.url product_url(product, format: :json)
end
