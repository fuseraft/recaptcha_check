class RecaptchaCheck
    def initialize(response, ip)
        @response = response
        @ip = ip
    end
  
    def self.verify(response, ip = nil)
        new(response, ip).verify
    end
  
    def verify
        require 'httparty'
        recaptcha_response = HTTParty.get(recaptcha_url(@response, secret, @ip))
        response_success?(recaptcha_response)
    end
  
    private

    RECAPTCHA_PRIVATE_KEY = 'RECAPTCHA_PRIVATE_KEY'.freeze
  
    def recaptcha_url(response, secret, ip)
        "https://www.google.com/recaptcha/api/siteverify?secret=#{secret}&response=#{response}&remoteip=#{ip}"
    end
  
    def secret
        if not self.secret_defined?
            require 'envl'
            Envl.auto_load

            puts "#{RECAPTCHA_PRIVATE_KEY} is not defined in ENV." if not self.secret_defined?
        end

        ENV[RECAPTCHA_PRIVATE_KEY]
    end

    def secret_defined?
        not ENV[RECAPTCHA_PRIVATE_KEY].nil? or not ENV[RECAPTCHA_PRIVATE_KEY].empty?
    end
  
    def response_success?(response)
        response.fetch('success')
    end
end