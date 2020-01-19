json.extract! product, :id, :name, :weight_type, :quantity, :price, :sale_price, :company_name, :created_at, :updated_at
json.url product_url(product, format: :json)
