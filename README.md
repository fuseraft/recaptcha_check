# recaptcha_check
A simple interface for verifying Google reCAPTCHA responses.

# Installation
```
gem install recaptcha_check
```

# Setup
You must call `RecaptchaCheck#register` once early in your application to set the reCAPTCHA private key before using `RecaptchaCheck#verify` in other parts of your application. 

```Ruby
RecaptchaCheck.register 'your_reCAPTCHA_Private-Key'
```

# Methods
`RecaptchaCheck#register`: sets the reCAPTCHA private key to be used during verification.

`RecaptchaCheck#verify`: returns `true` if the reCAPTCHA response passes verification.

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