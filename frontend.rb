require "unirest"

# response = Unirest.get("http://localhost:3000/api/products")
# products = response.body
# puts JSON.pretty_generate(products)

response = Unirest.get("http://localhost:3000/api/products/2")
product = response.body
puts JSON.pretty_generate(product)
