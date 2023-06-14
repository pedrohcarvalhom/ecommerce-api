class CostumerSerializer < ActiveModel::Serializer
  attributes :id, :cpf, :email, :name, :phone
end
