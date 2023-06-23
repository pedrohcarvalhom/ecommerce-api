module Addresses
  class BaseAddress
    def initialize(repository: AddressRepository)
      @repository = repository
    end
  end
end
