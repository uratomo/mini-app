class TweetsController < ApplicationController
  def index
    @tweets= Tweet.includes(:user).page(params[:page]).per(6).order("created_at DESC") 
  end

  def new
    @tweet= Tweet.new
  end

  def create
    @tweets = Tweet.create(tweet_params)
  end
  
  def edit
    @tweet=Tweet.find(params[:id])
  end

  def update
  tweet=Tweet.find(params[:id])
  tweet.update(tweet_params)
  redirect_to tweets_path, notice: 'tweetを編集しました'

 
  end
  def destroy
    tweet= Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: "index" ,notice: 'tweetを削除しました'

  end

  private

  def tweet_params
  params.require(:tweet).permit(:text).merge(user_id:current_user.id)
  end
end
