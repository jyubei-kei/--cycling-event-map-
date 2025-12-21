class Public::EventsController < ApplicationController
  def index
    @events = Event.published.order(starts_at: :asc)
  end

  def show
    @event = Event.published.find(params[:id])
    @aid_stations = @event.aid_stations
  end
end
