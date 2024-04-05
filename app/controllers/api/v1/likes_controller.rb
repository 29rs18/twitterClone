class Api::V1::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = current_user.likes.build(tweet: @tweet)
    if @like.save
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: params[:tweet_id])
    if @like.present?
      @like.destroy
      render json: { message: 'Like removed successfully' }
    else
      render json: { error: 'Like not found' }, status: :not_found
    end
  end
end
