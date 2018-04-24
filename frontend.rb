require "unirest"

response = Unirest.get("http://localhost:3000/api/products")
products = response.body
puts JSON.pretty_generate(products)
