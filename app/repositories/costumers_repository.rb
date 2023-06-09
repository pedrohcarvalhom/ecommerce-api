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

    def get_costumer(email)
      Costumer.find_by_email(email)
    end

    def find(id)
      Costumer.find(id)
    end

    def destroy(id)
      Costumer.destroy(id)
    end

    def update(attrs)
      Costumer.where(id: attrs['id']).update(attrs)
    end
  end
end
