class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @new_comment = @user.comments.new
    @comments = @user.comments
    @events = @user.events
    @transportation = ['Car', 'Bus', 'Train', 'Walking']
    session[:return_to] ||= request.referer
  end
end
