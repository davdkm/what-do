class EventsController < ApplicationController

  def index
    @events = Event.sorted_by_start_time
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.users
    @new_comment = current_user.comments.new if user_signed_in?
    @comments = @event.comments
    @tags = @event.tags
    @event_tags = @event.tags
  end

  def new
    @event = current_user.events.build
  end

  def create
    Time.zone = params[:event][:time_zone]
    @event = current_user.events.build(event_params)
    @event.organizer = current_user
    if authorize @event
      if @event.save
        redirect_to event_path(@event)
      else
        render :new, flash: {error: 'Uh oh'}
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
    @users = @event.users
    @user = current_user
  end

  def update
    @event = Event.find(params[:id])
    Time.zone = @event.time_zone
    if authorize @event
      if @event.update(event_params)
        redirect_to event_path(@event)
      else
        render :edit
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    if @event.delete
      redirect_to events_path, flash: {message: 'Event was succussfelly removed.'}
    else
      render :show
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :location, :start_time, :end_time, :time_zone, tag_ids: [], tags_attributes: [:name])
    end

end
