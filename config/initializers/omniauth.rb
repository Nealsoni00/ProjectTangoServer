Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cas,
           host: 'secure.its.yale.edu', login_url: '/cas/login', service_validate_url: '/cas/serviceValidate'
end

OmniAuth.config.on_failure = Proc.new do |env|
  SessionsController.action(:auth_failure).call(env)
end