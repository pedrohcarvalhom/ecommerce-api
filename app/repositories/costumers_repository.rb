class CostumersRepository
  class << self
    def create_costumer(*attrs)
      Costumer.create!(attrs)
    end

    def cpf_registered?(cpf)
      Costumer.exists?(cpf: cpf)
    end
  end
end
