class EventsController < ApplicationController

  def index
    @events = Event.all.sort_by_start_time
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.users
    @user = current_user
    @new_comment = @user.comments.new if @user
    @comments = @event.comments
  end

  def new
    @event = current_user.events.build
  end

  def create
    binding.pry
    @event = current_user.events.build(event_params)
    authorize @event
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, flash: {error: 'Uh oh'}
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :location, :start_time, :end_time)
    end

end
