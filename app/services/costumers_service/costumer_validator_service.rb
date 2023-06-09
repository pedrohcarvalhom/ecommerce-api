module CostumersService
  class CostumerValidatorService
    def initialize(costumer_params:)
      @name = costumer_params[:name]
      @email = costumer_params[:email]
      @cpf = costumer_params[:cpf]
      @address = costumer_params[:address]
      @phone = costumer_params[:phone]
    end

    def validate
      validate_name_presence
      validate_name_length
    end

    private

    def validate_name_length
      return true if @name.length >= 3

      raise ArgumentError, 'Name must have more than three caracters'
    end

    def validate_name_presence
      return true if @name.present?

      raise ArgumentError, 'Name cannot be empty'
    end
  end
end
