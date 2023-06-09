module Costumers
  class CreateCostumer
    def initialize(costumer_params:)
      @costumer_params = costumer_params
      @repository = CostumersRepository
    end

    def perform
      validate_params
      create_costumer
    end

    private

    def validate_params
      CostumersService::CostumerValidatorService.new(costumer_params: @costumer_params).validate
    end

    def create_costumer
      @repository.create_costumer(@costumer_params)
    end
  end
end
