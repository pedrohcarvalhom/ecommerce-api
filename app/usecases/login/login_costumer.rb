module Login
  class LoginCostumer
    attr_reader :costumer_repository, :email, :password

    def initialize(email, password, costumer_repository: CostumersRepository)
      @costumer_repository = costumer_repository
      @email = email
      @password = password
    end

    def execute
      is_authenticated = costumer_repository.authenticate_costumer(email, password)

      raise SecurityError unless is_authenticated

      costumer_repository.get_costumer(email)
    end
  end
end
