require "rubygems"
require "json"
require "net/http"
require "uri"

uri = URI.parse("https://products.dollarshaveclub.com/cms/edge/v3/products.json")

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)

results = JSON.parse(response.body)

products = results["products"]

lightProducts = Array.new

# you are looping through all of your products via product variable
products.each do |product| #this is a loop in ruby, product is an object that has the info
  # name = product["name"]
  # id = product["id"]
  # paragraph = product["paragraph"]

  #within the loop you are creating an object "a light product"- condensed information
  lightProduct = Hash.new
  lightProduct["name"] = product["name"]
  lightProduct["id"] = product["id"]
  lightProduct["paragraph"] = product["paragraph"]

  # unless lightProduct["paragraph"]
  #   lightProduct["paragraph"] = "MY PARAGRAPH"
  # end

  # Adding your current lightProduct to lightProducts
  lightProducts.push(lightProduct) #array of all the product names

end

puts lightProducts
