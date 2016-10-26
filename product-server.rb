# include dependencies
require 'sinatra'
require "rubygems"
require "json"
require "net/http"
require "uri"


# get '/' do
#   'Hello world!'
# end

# get '/myName' do
#   'Adrena Oushana'
# end

# post '/login' do
#   # Handle login
# end
#
# get '/login' do
#
# end

# this creates a new route that can be getted. line 26 creates the route. This is a get request to '/products'
get '/products' do
  uri = URI.parse("https://products.dollarshaveclub.com/cms/edge/v3/products.json")

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(uri.request_uri)

  # downloads the file from line # 27
  response = http.request(request)

  # you get a response back from request and convert it to an object. JSON is a string that looks like an object
  results = JSON.parse(response.body)
  #created a new variable, easy to reference
  products = results["products"]

  # this will contain smaller product objects
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


  # for(var i = 0; i<products.length; i++) {
  #   product = products[i];
  # }
  # converting lightProducts which is an object to a JSON string

  #lightProducts.to_json



       products_html = ""
      products.each do |product|
        products_html = products_html + "<div>#{product["name"]}</div></br>"
      end


assets/images/product-images/2000xH-bbg/DSL-4Z-CURRENT-5fccc9a63913feec3d2b609d115e3967.png(products_html)




end

def build_html(products)
  html = "<html>
  <head>
  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/css/bootstrap.css\" />
  <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>
  <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js\"></script>
  </head>
  <body>

   <nav class=\"navbar navbar-default\"><a class=\"navbar-brand\" href=\"#\">Brand</a></nav>
    #{products}
  </body>"
end
