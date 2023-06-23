class AddReferenceProductsToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :category_id, :integer
    add_foreign_key :products, :categories, validate: false
  end
end
