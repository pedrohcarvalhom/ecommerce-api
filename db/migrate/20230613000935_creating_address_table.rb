class CreatingAddressTable < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.references :costumer, foreign_key: true

      t.timestamps
    end

    remove_column :costumers, :address, :string
  end
end
