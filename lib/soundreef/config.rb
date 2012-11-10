class Soundreef
  class << self
    attr_accessor :configuration 

    def config
      self.configuration ||= Soundreef::Configuration.new
    end
  
    def configure
      yield(config)
    end
  end
end

class Soundreef::Configuration
  attr_accessor :public_key, :private_key
end