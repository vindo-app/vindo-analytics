class PingsController < ApplicationController
  before_action :set_ping, only: [:show, :edit, :update, :destroy]

  # GET /pings
  def index
    @pings = Ping.all
  end

  # GET /pings/1
  def show
  end

  # GET /pings/new
  def new
    @ping = Ping.new
  end

  # GET /pings/1/edit
  def edit
  end

  # POST /pings
  def create
    @ping = Ping.new(ping_params)

    if @ping.save
      redirect_to @ping, notice: 'Ping was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pings/1
  def update
    if @ping.update(ping_params)
      redirect_to @ping, notice: 'Ping was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pings/1
  def destroy
    @ping.destroy
    redirect_to pings_url, notice: 'Ping was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ping
      @ping = Ping.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ping_params
      params.require(:ping).permit(:uuid, :version, :ip)
    end
end
