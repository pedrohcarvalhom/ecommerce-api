class CostumerSerializer < ActiveModel::Serializer
  attributes :id, :cpf, :email, :name, :phone

  has_one :address
end
