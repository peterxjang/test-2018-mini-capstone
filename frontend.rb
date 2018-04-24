require "unirest"

# response = Unirest.get("http://localhost:3000/api/products")
# products = response.body
# puts JSON.pretty_generate(products)

# response = Unirest.get("http://localhost:3000/api/products/2")
# product = response.body
# puts JSON.pretty_generate(product)

params = {
  name: "Test name",
  price: 3,
  image_url: "https://c1.staticflickr.com/6/5337/8940995208_5da979c52f.jpg",
  description: "Test description"
}
response = Unirest.post("http://localhost:3000/api/products", parameters: params)
product = response.body
puts JSON.pretty_generate(product)
