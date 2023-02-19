# recaptcha_check (reCAPTCHA verification)
A simple interface for verifying Google reCAPTCHA responses.

You can find the gem here: [RubyGems.org](https://rubygems.org/gems/recaptcha_check)

# Installation
```
gem install recaptcha_check
```

# Methods
`RecaptchaCheck#register`: sets the reCAPTCHA private key to be used during verification.

`RecaptchaCheck#verify`: returns `true` if the reCAPTCHA response passes verification.

# Configuration
You must call `RecaptchaCheck#register` once early in your application to set the reCAPTCHA private key before using `RecaptchaCheck#verify` in other parts of your application.
```Ruby
RecaptchaCheck.register 'your_reCAPTCHA_PrivateKey'
```

# Example usage in a Sinatra app
```Ruby
post '/contact' do
    require 'recaptcha_check'

    if RecaptchaCheck.verify(params)
        # mailer.send params
        redirect '/contact/sent'
    else
        redirect back
    end
end
```
