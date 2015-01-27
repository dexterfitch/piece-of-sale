require('spec_helper')

describe(Product) do
  it("limits the length of a product name to 140 characters") do
    product = Product.new({:product_name => "z".*(141)})
    expect(product.save()).to(eq(false))
  end

  it("returns false if no data entered in product_name") do
    product = Product.new({:product_name => ""})
    expect(product.save()).to(eq(false))
  end
end
