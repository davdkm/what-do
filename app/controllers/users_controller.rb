class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @new_comment = @user.comments.new
    @comments = @user.comments
    @schedules = Schedule.all
    #s@transportations = Transportation.all
    session[:return_to] ||= request.referer
  end
end
