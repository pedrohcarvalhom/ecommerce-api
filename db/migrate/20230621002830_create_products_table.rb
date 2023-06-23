class CreateProductsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :subtitle
      t.integer :number_of_reviews
      t.integer :price
      t.integer :quantity
      t.string :description
      t.string :colors, array: true

      t.timestamps
    end
  end
end
