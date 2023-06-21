class AddressSerializer < ActiveModel::Serializer
  attributes :id, :city, :country, :state, :street, :zip_code

  belongs_to :costumer
end
