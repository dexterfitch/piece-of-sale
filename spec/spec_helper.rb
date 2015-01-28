ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("product")

RSpec.configure do |config|
  config.after(:each) do
    Product.all().each() do |product|
      product.destroy()
    end
  end
end




# Handy input checkbox model
#
# http://www.w3schools.com/tags/tryit.asp?filename=tryhtml_form_checkbox
