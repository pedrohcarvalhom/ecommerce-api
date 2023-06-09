module TokenGenerator
  def generate_token
    SecureRandom.hex
  end
end
