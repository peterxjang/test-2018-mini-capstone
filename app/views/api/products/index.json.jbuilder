json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.description product.description
  json.images product.images

  json.is_discounted product.is_discounted
  json.tax product.tax
  json.total product.total
end
