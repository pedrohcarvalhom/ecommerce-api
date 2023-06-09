class Costumer < ApplicationRecord
  before_create :create_token

  has_secure_password

  private

  def create_token
    token = SecureRandom.hex
    self.token = token
  end
end
