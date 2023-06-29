FactoryBot.define do
  factory :address do
    street { 'rua 123' }
    city  { 'fln' }
    state { 'sc' }
    country { 'br' }
    zip_code { '123456' }
  end
end
