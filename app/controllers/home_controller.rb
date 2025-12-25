class HomeController < ApplicationController
  def top
     @events = Event.where(published: true).order(:starts_at)
  end
end
