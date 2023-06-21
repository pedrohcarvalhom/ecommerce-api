class AddCostumersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :costumers do |t|
      t.string :name, null: false
      t.string :address
      t.string :phone
      t.string :cpf
      t.string :email
      t.string :password_digest
      t.string :token
      t.string :recover_password_token

      t.timestamps
    end
  end
end
