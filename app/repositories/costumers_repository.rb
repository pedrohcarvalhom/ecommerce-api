class CostumersRepository < BaseRepository
  class << self
    def create_related_address(created_costumer, *address_attrs)
      created_costumer.create_address!(address_attrs.first)
    end

    def cpf_registered?(cpf)
      entity.exists?(cpf: cpf)
    end

    def email_registered?(email)
      entity.exists?(email: email)
    end

    def get_costumer(email)
      entity.find_by_email(email)
    end

    private

    def entity
      Costumer
    end
  end
end
