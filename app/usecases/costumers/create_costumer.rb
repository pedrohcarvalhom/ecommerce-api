module Costumers
  class CreateCostumer
    def initialize(costumer_params:)
      @costumer_params = costumer_params.transform_keys(&:to_sym)
      @repository = CostumersRepository
      @validator = CostumersService::CostumerValidatorService.new(costumer_params: @costumer_params)
    end

    def perform
      validate_params
      ActiveRecord::Base.transaction do
        costumer = create_costumer
        create_address(costumer)

        costumer
      end
    end

    private

    def validate_params
      @validator.validate_presence
      @validator.validate_cpf
      @validator.validate_email
      @validator.validate_lengths
    end

    def create_costumer
      @repository.create_costumer(@costumer_params.except(:address))
    end

    def create_address(costumer)
      @repository.create_related_address(costumer, @costumer_params[:address])
    end
  end
end
