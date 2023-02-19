Gem::Specification.new do |s|
    s.name        = 'recaptcha_check'
    s.version     = '0.0.5'
    s.summary     = 'A simple interface for verifying Google reCAPTCHA responses.'
    s.description = 'A simple interface for verifying Google reCAPTCHA responses in Ruby web apps.'
    s.authors     = ['Scott Stauffer']
    s.email       = 'scott@fuseraft.com'
    s.files       = ['lib/recaptcha_check.rb']
    s.metadata    = { 
      'source_code_uri' => 'https://github.com/scstauf/recaptcha_check',
      'documentation_uri' => 'https://rubydoc.info/github/scstauf/recaptcha_check/'
    }
    s.homepage    =
      'https://rubygems.org/gems/recaptcha_check'
    s.license       = 'MIT'
    s.required_ruby_version = '>= 2.7.0'
    s.add_runtime_dependency 'httparty', '~> 0.20', '>= 0.20.0'
  end