class Admin::AidStationsController < Admin::BaseController
  before_action :set_event
  before_action :set_aid_station, only: %i[edit update destroy show]

  def index
    @aid_stations = @event.aid_stations
  end

  def show
  end

  def new
    @aid_station = @event.aid_stations.new
  end

  def create
    @aid_station = @event.aid_stations.new(aid_station_params)
    if @aid_station.save
      redirect_to admin_event_aid_stations_path(@event), notice: "エイドを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @aid_station.update(aid_station_params)
        redirect_to admin_event_aid_stations_path(@event), notice: "エイドを更新しました"
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @aid_station.destroy
    redirect_to admin_event_aid_stations_path(@event), notice: "エイドを削除しました"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_aid_station
    @aid_station = @event.aid_stations.find(params[:id])
  end

  def aid_station_params
    params.require(:aid_station).permit(:name, :description)
  end
end
