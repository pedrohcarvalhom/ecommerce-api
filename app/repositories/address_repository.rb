class AddressRepository
  class << self
    def create_address(*attrs)
      entity.create!(attrs)
    end

    def destroy(id)
      entity.destroy(id)
    end

    private

    def entity
      Address
    end
  end
end
