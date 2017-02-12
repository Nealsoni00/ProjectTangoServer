Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cas, ENV['CAS_CLIENT_ID'], ENV['CAS_CLIENT_SECRET'],
           host: 'secure.its.yale.edu/cas/'
end

OmniAuth.config.on_failure = Proc.new do |env|
  SessionsController.action(:auth_failure).call(env)
end