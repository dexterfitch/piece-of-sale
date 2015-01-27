class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.column(:product_name, :string)
      t.column(:price, :integer)

      t.timestamps
    end
  end
end
