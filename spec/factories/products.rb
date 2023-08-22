FactoryBot.define do
  factory :product do
    association :category

    title { 'Pedro' }
    price { 10 }
  end
end
