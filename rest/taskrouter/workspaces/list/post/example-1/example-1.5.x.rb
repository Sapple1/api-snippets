# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

client = Twilio::REST::Client.new(account_sid, auth_token)

workspace = client.taskrouter.v1.workspaces
                  .create(friendly_name: 'NewWorkspace',
                          event_callback_url: 'http://requestb.in/vh9reovh',
                          template: 'FIFO')

puts workspace.friendly_name
