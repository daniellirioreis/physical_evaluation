json.array!(@sales) do |sale|
  json.extract! sale, :id, :student_id, :package_id, :done, :price, :type_sale, :discount, :installment
  json.url sale_url(sale, format: :json)
end
