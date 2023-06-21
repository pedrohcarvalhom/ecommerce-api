module Costumers
  class UpdateCostumer
    def initialize(costumer_params:)
      @costumer_params = costumer_params
      @repository = CostumersRepository
    end

    def perform
      @repository.update(@costumer_params)
    end
  end
end
