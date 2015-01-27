class ChangePriceFromIntegerToDecimal < ActiveRecord::Migration
  def change
    remove_column(:products, :price, :integer)
    add_column(:products, :price, :decimal)
  end
end
