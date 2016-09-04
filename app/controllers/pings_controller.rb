class PingsController < ApplicationController
    http_basic_authenticate_with name: ENV["UI_USERNAME"], password: ENV["UI_PASSWORD"]
    before_action :set_ping, only: [:show, :edit, :update, :destroy]

    # GET /pings
    def index
        @pings = Ping.all
    end

    # GET /pings/1
    def show
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_ping
        @ping = Ping.find(params[:id])
    end
end
