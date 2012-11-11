class Soundreef
  class Batches
    def self.list(params = {})
      Soundreef::Request.new('/batch/list', params).response
    end

    def self.get(params = {})
      Soundreef::Request.new('/batch/get', params).response
    end
  end
end