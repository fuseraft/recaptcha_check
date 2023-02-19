# recaptcha_check
A simple interface for verifying Google reCAPTCHA responses.

# installation
```
gem install recaptcha_check
```

# prerequisites
You must have a `.env` file containing your reCAPTCHA private key in a key called `RECAPTCHA_PRIVATE_KEY`. 

It should look something like this.
```
RECAPTCHA_PRIVATE_KEY = 'your--_reCAPTCHAPrivateKey'
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