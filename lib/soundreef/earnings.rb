class Soundreef
  class Earnings
    def self.get(params = {})
      Soundreef::Request.new('/earnings/get', params).response
    end
  end
end