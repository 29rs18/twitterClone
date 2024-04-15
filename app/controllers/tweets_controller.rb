# app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user, only: [:new, :create]
  before_action :set_tweet, only: [:show, :destroy]

  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def show
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: 'Tweet was successfully created.'
    else
      render :index
    end
  end

  def destroy
    puts "Destroy action called" # Debugging output
    puts "Tweet ID: #{@tweet.id}" # Debugging output

    if @tweet.user == current_user
      @tweet.destroy
      redirect_to tweets_path, notice: 'Tweet was successfully deleted.'
    else
      redirect_to tweets_path, alert: 'You are not authorized to delete this tweet.'
    end
  end


  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def require_user
    redirect_to login_path, alert: "You must be logged in to perform that action" unless current_user
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
