module CostumersService
  class CostumerValidatorService
    def initialize(costumer_params:)
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

    private

    def validate_name_length
      BasicValidatorService.validate_length(@name, 'Name', 3)
    end

    def validate_email_length
      BasicValidatorService.validate_length(@email, 'Email', 7)
    end
  end
end
