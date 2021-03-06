class Soundreef
  class << self
    attr_accessor :configuration 

    def config
      self.configuration ||= Soundreef::Configuration.new
    end
  
    def reset_configuration
      self.configuration = Soundreef::Configuration.new
    end

    def configure
      yield(config)
    end
  end
end

class Soundreef
  class Configuration
    attr_accessor :public_key, :private_key, :host

    def host
      @host || 'api.soundreef.com'
    end
  end
end