class ValidateForeignKeyAtProducts < ActiveRecord::Migration[6.0]
  def change
    validate_foreign_key :products, :categories
  end
end
