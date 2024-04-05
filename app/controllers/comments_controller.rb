# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :require_user

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to tweet_path(@tweet), notice: 'Comment was successfully added.'
    else
      redirect_to tweet_path(@tweet), alert: 'Failed to add comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_user
    unless current_user
      redirect_to tweet_path(params[:tweet_id]), alert: 'You must be logged in to add a comment.'
    end
  end
end
