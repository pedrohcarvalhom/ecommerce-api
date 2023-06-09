module CostumersService
  class CostumerValidatorService
    def initialize(costumer_params:)
      @costumer_params = costumer_params
      @name = costumer_params[:name]
      @email = costumer_params[:email]
      @cpf = costumer_params[:cpf]
      @address = costumer_params[:address]
      @phone = costumer_params[:phone]
    end

    def validate_lengths
      validate_name_length
      validate_email_length
    end

    def validate_presence
      BasicValidatorService.validate_presence(@costumer_params)
    end

    def validate_cpf
      BasicValidatorService.validate_cpf(@cpf)

      raise ArgumentError, 'CPF already registered' if CostumersRepository.cpf_registered?(@cpf)
    end

    private

    def validate_name_length
      BasicValidatorService.validate_length(@name, 'Name', 3)
    end

    def validate_email_length
      BasicValidatorService.validate_length(@email, 'Email', 7)
    end
  end
end
