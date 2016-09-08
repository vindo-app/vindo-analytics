require 'httparty'

class Message < ApplicationRecord
    belongs_to :ping

    after_create :deliver

    def deliver
        if self.from_user
            deliver_to_slack
        else
            deliver_to_user
        end
    end

    private
    def deliver_to_slack
        puts "delivering to slack"
        response = HTTParty.post(ENV["OUTGOING_URL"], body: {
            text: self.body,
            username: self.ping.uuid,
        }.to_json)
        puts "response: #{response.body}"
    end

    def deliver_to_user
        MessagesChannel.broadcast_to(self.ping, self)
    end
end
