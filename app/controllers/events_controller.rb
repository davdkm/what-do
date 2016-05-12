class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all.sort_by_start_time
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.users
    @user = current_user
    @new_comment = @user.comments.new
    @comments = @event.comments
  end

end
