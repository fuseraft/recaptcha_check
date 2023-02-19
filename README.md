# recaptcha_check
A simple interface for verifying Google reCAPTCHA responses.

# installation
```
gem install recaptcha_check
```

# example usage in a sinatra app
```Ruby
post '/contact' do
    require 'recaptcha_check'

    if RecaptchaCheck.verify(params['g-recaptcha-response'])
        # mailer.send(params)
        redirect '/contact/sent'
    else
        redirect back
    end
end
```