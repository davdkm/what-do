class SchedulesController < ApplicationController

  def create
    @event = Event.find_by(id: params[:event_id])
    @user = User.find_by(id: params[:user_id])

    @schedule = @user.schedules.build(:event => @event)
    if @schedule.save
      redirect_to event_path(@event), flash: {notice: 'You are now going to this event!'}
    else
      redirect_to event_path(@event), flash: {alert: 'Oop! Could not save your schedule.'}
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.users.delete(current_user)
    redirect_to event_path(@event), flash: {notice: 'You are no longer attending this event.'}
  end
end
