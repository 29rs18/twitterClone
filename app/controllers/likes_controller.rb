class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = current_user.likes.build(tweet: @tweet)

    if @like.save
      redirect_to @tweet, notice: 'Tweet liked successfully.'
    else
      redirect_to @tweet, alert: 'Failed to like the tweet.'
    end
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: params[:tweet_id])

    if @like.present?
      @like.destroy
      redirect_to @like.tweet, notice: 'Tweet unliked successfully.'
    else
      redirect_to root_path, alert: 'Failed to unlike the tweet.'
    end
  end
end
