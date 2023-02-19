class RecaptchaCheck  
    def self.verify(params, ip = nil)
        new(params['g-recaptcha-response'], ip).verify_recaptcha
    end

    def self.register(recaptcha_secret_key)
        ENV[RECAPTCHACHECK_SECRET_KEY] = recaptcha_secret_key
    end

    def verify_recaptcha
        require 'httparty'
        recaptcha_response = HTTParty.get(recaptcha_url(@response, self.secret, @ip))
        self.response_success?(recaptcha_response)
    end
  
    private

    RECAPTCHACHECK_SECRET_KEY = 'RECAPTCHACHECK_SECRET_KEY'.freeze
  
    def initialize(response, ip)
        @response = response
        @ip = ip
    end

    def recaptcha_url(response, secret, ip)
        "https://www.google.com/recaptcha/api/siteverify?secret=#{secret}&response=#{response}&remoteip=#{ip}"
    end
  
    def response_success?(response)
        response.fetch('success')
    end
  
    def secret
        raise "Use RecaptchaCheck#register to set the reCAPTCHA secret key." if not self.secret_defined?
        ENV[RECAPTCHACHECK_SECRET_KEY]
    end

    def secret_defined?
        not ENV[RECAPTCHACHECK_SECRET_KEY].nil?
    end
end