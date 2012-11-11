class Soundreef
  class Songs
    def self.list(params = {})
      Soundreef::Request.new('/song/list', params).response
    end

    def self.get(params = {})
      Soundreef::Request.new('/song/get', params).response
    end
  end
end