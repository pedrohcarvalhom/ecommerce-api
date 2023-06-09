class CostumersRepository
  class << self
    def create_costumer(*attrs)
      Costumer.create!(attrs)
    end

    def cpf_registered?(cpf)
      Costumer.exists?(cpf: cpf)
    end

    def email_registered?(email)
      Costumer.exists?(email: email)
    end
  end
end
