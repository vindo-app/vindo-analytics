class AnalyticsController < ApplicationController
    def ping
        uuid = request.remote_ip
        version = params[:version]
        
        @ping = Ping.find_by_uuid(uuid) || Ping.create(uuid: uuid)
        @ping.update(version: version)

        head :no_content
    end
end
