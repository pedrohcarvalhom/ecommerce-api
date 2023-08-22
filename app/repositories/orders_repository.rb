class OrdersRepository < BaseRepository
  class << self
    def all
      entity.all
    end

    private

    def entity
      Order
    end
  end
end
