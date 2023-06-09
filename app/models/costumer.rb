class Costumer < ApplicationRecord
  before_create :create_token

  has_secure_password
  has_secure_token
end
