class AddOrderColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :shipping_cost, :integer
    add_column :orders, :total_cost, :integer
    add_column :orders, :delivery_date, :datetime
    add_column :orders, :quantity, :integer

    add_column :orders, :product_id, :integer
    add_foreign_key :orders, :products, validate: false

    add_column :orders, :costumer_id, :integer
    add_foreign_key :orders, :costumers, validate: false

    add_column :orders, :address_id, :integer
    add_foreign_key :orders, :addresses, validate: false
  end
end
