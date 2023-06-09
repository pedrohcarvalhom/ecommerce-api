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
      BasicValidatorService.validate_presence(@costumer_params)
      CpfValidatorService.new.validate_each(@costumer_params["cpf"])
      @validator.validate_lengths
    end

    def create_costumer
      @repository.create_costumer(@costumer_params)
    end
  end
end
