class TwilioController < ApplicationController
  def self.send_message(phone_number, message)
   # @twilio_number = ENV['TWILIO_NUMBER']
   @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
   message = @client.messages.create(
     :from => 'bibtome',
     :to => phone_number,
     :provide_feedback => true,
     :body => message
     )
   puts "sid: #{message.sid} delivered: #{message.status}"
 end
end

# '(904) 626-7040'
# '+19046267040'
