class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :number_of_reviews, :price, :quantity, :description, :colors

  belongs_to :category
end
