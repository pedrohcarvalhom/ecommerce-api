class CostumersRepository
  class << self
    def create_costumer(*attrs)
      Costumer.create!(attrs)
    end
  end
end
