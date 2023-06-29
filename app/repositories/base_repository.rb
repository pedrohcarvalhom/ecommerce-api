class BaseRepository
  class << self
    def create(params:)
      entity.create!(params)
    end

    def find(id)
      entity.find(id)
    end

    def destroy(id)
      entity.destroy(id)
    end

    def update(attrs)
      entity.where(id: attrs[:id]).update(attrs)
    end
  end
end
