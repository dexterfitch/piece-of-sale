require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/product')
require('pg')
require('pry')

get('/') do
  @products = Product.all()
  erb(:index)
end

post('/products') do
  product_name = params["product_name"]
  price = params["price"]
  product = Product.new({:product_name => product_name, :price => price, :id => nil})
  product.save()
  redirect('/')
end

patch('/products/:id') do
  product_name = params["product_name"]
  price = params["price"]
  @product = Product.find(params["id"].to_i())
  @product.update({:product_name => product_name, :price => price})
  redirect('/')
end

get('/products/:id/edit') do
  @product = Product.find(params["id"].to_i())
  erb(:product_edit)
end

params = {"product_name" => "fruit", "price" => 5, "id" => "5"}
