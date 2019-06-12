class TweetsController < ApplicationController
  def index
  end

  def new
    @tweet= Tweet.new
  end

  def create
    @tweets = Tweet.create(tweet_params)
    redirect_to action: :index
  end
  
  def edit
    @tweet=Tweet.find(params[:id])
  end

  def update

  end

  private

  def tweet_params
  params.require(:tweet).permit(:text,).merge(user_id:current_user.id)
  end
end
