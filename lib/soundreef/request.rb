class Soundreef
  class Request
    def initialize(params = {})
      @params = params
    end

    def request_string
      @params.sort.map{|p| p.map{|a| a}.join}.join.downcase
    end

    def signature
      OpenSSL::HMAC.hexdigest('sha256', Soundreef.config.private_key, request_string.to_s)
    end

    def response
      uri     = URI.parse("http://api.soundreef.com/song/list")
      http    = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)
      
      request.add_field('x-publickey', Soundreef.config.public_key)
      request.add_field('x-signature', signature)
      request.set_form_data({'timestamp' => Time.now.utc.to_i})
      
      http.request(request)
    end
  end
end
