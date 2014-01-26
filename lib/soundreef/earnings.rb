class Soundreef
  class Earnings
    def self.list(params = {})
      Soundreef::Request.new('/earnings/list', params).response
    end

    def self.get(params = {})
      Soundreef::Request.new('/earnings/get', params).response
    end
  end
end