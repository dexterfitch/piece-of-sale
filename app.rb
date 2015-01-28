require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/product')
require('./lib/purchase')
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

delete('/products/:id') do
  @product = Product.find(params["id"].to_i())
  @product.destroy()
  redirect('/')
end

get('/shopping_cart') do
  @products = Product.all
  erb(:shopping_cart)
end

post('/shopping_cart') do
  purchase = params["purchase"]
  product_id = params["product_id"]
  add_to_cart = Purchase.new({:product_id => product_id})
  add_to_cart.save()
  redirect('/shopping_cart')
end
