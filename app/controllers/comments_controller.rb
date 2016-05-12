class CommentsController < ApplicationController

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @comment = @user.comments.new(comment_params)
    if @comment.save
      redirect_to request.referer, flash: {notice: 'Thanks for commenting.'}
    else
      redirect_to request.referer, flash: {alert: 'Could not post comment.'}
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    @user = @comment.user
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    authorize @comment
    @comment.update(comment_params)
    redirect_to request.referer, flash: {notice: 'Comment was updated.'}
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    authorize @comment
    @comment.delete
    redirect_to request.referer, flash: {notice: 'Comment was removed.'}
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :event_id)
    end
end
