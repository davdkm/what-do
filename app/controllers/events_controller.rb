class EventsController < ApplicationController

  def index
    @events = Event.all.sort_by_start_time
  end

end
