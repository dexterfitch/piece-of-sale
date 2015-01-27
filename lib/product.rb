class Product < ActiveRecord::Base
  validates(:product_name, {:presence => true, :length => { :maximum => 140}})
end
