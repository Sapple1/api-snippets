require 'twilio-ruby'
require 'sinatra'

get '/token' do
# To set up environmental variables, see http://twil.io/secure
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  capability = Twilio::JWT::ClientCapability.new(account_sid, auth_token)

  # Create an application sid at
  # twilio.com/console/phone-numbers/dev-tools/twiml-apps and use it here
  capability.add_scope(Twilio::JWT::ClientCapability::OutgoingClientScope.new('APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'))
  capability.add_scope(Twilio::JWT::ClientCapability::IncomingClientScope.new(params['ClientName']))
  token = capability.to_jwt

  content_type 'application/jwt'
  token
end

# TODO: post '/voice' do
