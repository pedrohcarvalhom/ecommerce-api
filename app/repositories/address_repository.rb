class AddressRepository < BaseRepository
  class << self
    private

    def entity
      Address
    end
  end
end
