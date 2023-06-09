require 'cpf_cnpj'

class BasicValidatorService
  class << self
    def validate_presence(hash)
      hash.each do |hash_key, hash_value|
        raise ArgumentError, "#{hash_key.to_s.capitalize} cannot be blank" if hash_value.blank?
      end
    end

    def validate_length(arg, key, min_length)
      return if arg.length >= min_length

      raise ArgumentError, "#{key} must have at least #{min_length} caracters"
    end

    def validate_cpf(cpf)
      return if CPF.valid?(cpf)

      raise ArgumentError, 'Invalid CPF'
    end
  end
end
