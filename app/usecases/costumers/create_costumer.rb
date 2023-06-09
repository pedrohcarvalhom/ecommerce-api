module Costumers
  class CreateCostumer
    def initialize(costumer_params:)
      @costumer_params = costumer_params
      @repository = CostumersRepository
      @validator = CostumersService::CostumerValidatorService.new(costumer_params: @costumer_params)
    end

    def perform
      validate_params
      create_costumer
    end

    private

    def validate_params
      @validator.validate_presence
      # @validator.validate_cpf
      # @validator.validate_email
      @validator.validate_lengths
    end

    def create_costumer
      @repository.create_costumer(@costumer_params)
    end
  end
end
