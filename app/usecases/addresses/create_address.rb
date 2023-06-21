module Addresses
  class CreateAddress < BaseAddress
    def perform(address_params:, costumer_id:)
      @repository.create_address(address_params, costumer_id)
    end
  end
end
