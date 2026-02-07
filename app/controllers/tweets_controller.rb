class TweetsController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  def show

  end

  def index
    @tweets = Tweet.order(created_at: :desc)
  end
  
  def new
    @tweet = Tweet.new
  end


  def create

    @tweet = Tweet.new(params.require(:tweet).permit(:message))

    if @tweet.save
      flash[:notice] = "Tweet posted!"
      redirect_to new_tweet_path
    else
      render :new
    end
  end
end
