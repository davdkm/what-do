class CommentsController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    @comment = @user.comments.new(comment_params)
    if @comment.save
      redirect_to request.referer, flash: {notice: 'Thanks for commenting.'}
    else
      redirect_to request.referer, flash: {alert: 'Could not post comment.'}
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :event_id)
    end
end
