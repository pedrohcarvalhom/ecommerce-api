class AddIndexToEmailAndToken < ActiveRecord::Migration[6.0]
  def change
    add_index :costumers, :token
    add_index :costumers, :email
  end
end
