ENV['PINGDOM_CHECK_ID'] = '1575076'
ENV['APP_STORE_ID'] = '980255991'
ENV['APP_STORE_COUNTRY'] = 'kz'

require 'dotenv'
Dotenv.load
require 'dashing'

configure do
  set :auth_token, ENV['AUTH_TOKEN']

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
