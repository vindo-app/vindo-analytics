class MessagesChannel < ApplicationCable::Channel
    def subscribed
        ping = Ping.find_by_uuid(params[:uuid])
        stream_for ping
    end

    def unsubscribed
        # Any cleanup needed when channel is unsubscribed
    end
end
