require "date"

class MessagesController < ApplicationController
    before_action :set_ping
    skip_before_action :verify_authenticity_token

    def index
        since = Time.at(params[:since].to_s.to_i).to_datetime
        messages = Message.where("messages.created_at > ?", since).where(ping: @ping)
        render json: messages
    end
    
    def create
        text = params[:text]
        from_user = !@ping.nil?
        if !from_user 
            head :forbidden if params[:token] != ENV["INCOMING_TOKEN"]
            uuid = text.slice!(/\A[a-z]{30,50} /)
            if uuid.nil?
                render nothing: true
                return
            end
            uuid.chomp!(" ")

            @ping = Ping.find_by_uuid(uuid)
            if @ping.nil?
                render_slack "Ping ID not found."
                return
            end
        end

        puts "from_user is #{from_user}"
        puts "uuid is #{params[:uuid]}"
        @message = Message.create(body: text, from_user: from_user, ping: @ping)
        head :no_content
    end

    private
    def set_ping
        @ping = Ping.find_by_uuid(params[:uuid])
    end

    def render_slack(text)
        render json: {text: text}
    end
end
