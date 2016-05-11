class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all.sort_by_start_time
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.users
  end

end
