class EventsController < ApplicationController
  def index
    @events = Event.order(created_at: :asc)
  end

  def show
    @event = Event.find(params[:id])
    @aid_stations = @event.aid_stations
  end
end
