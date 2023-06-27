require 'cpf_cnpj'

FactoryBot.define do
  factory :costumer do
    name { 'Pedro' }
    phone  { '48 996049910' }
    cpf { CPF.generate }
    email { 'email@gmail.com' }
    password { '123456' }
  end
end
