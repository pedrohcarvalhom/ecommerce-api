class Costumer < ApplicationRecord
  has_secure_password
  has_secure_token
  has_secure_token :recover_password_token
end
