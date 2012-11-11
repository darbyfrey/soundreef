class Soundreef
  class Request
    attr_accessor :params

    def initialize(endpoint, params = {})
      @endpoint = endpoint
      @params = params.merge({:timestamp => Time.now.to_i})
    end

    def request_string
      @params.sort.map{|p| p.map{|a| a}.join}.join.downcase
    end

    def signature
      OpenSSL::HMAC.hexdigest('sha256', Soundreef.config.private_key, request_string)
    end

    def uri
      URI::HTTP.build({:host => Soundreef.config.host, :path => @endpoint})
    end

    def response
      http    = Net::HTTP.new(uri.host)
      request = Net::HTTP::Post.new(uri.request_uri)
      
      request.add_field('x-publickey', Soundreef.config.public_key)
      request.add_field('x-signature', signature)
      request.set_form_data(@params)
      
      http.request(request)
    end
  end
end
