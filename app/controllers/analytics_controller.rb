class AnalyticsController < ApplicationController
    def ping
        info = {
            uuid: params.require(:uuid),
            ip: request.remote_ip,
            version: params.require(:version)
        }
        if params[:programs]
            info[:programs] = params.require(:programs).map do |program_name|
                Program.with_name(program_name)
            end
        end
        
        @ping = Ping.find_by_uuid(info[:uuid])
        if @ping
            @ping.update(info)
        else
            @ping = Ping.create(info)
        end
        if @ping.invalid?
            logger.debug @ping.errors.full_messages
            head :bad_request
        else
            head :no_content
        end
    end
end
