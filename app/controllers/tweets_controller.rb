class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @all_user = User.where.not(:id => current_user.id )
        @tweets = Tweet.where(user_id: current_user.followers.pluck(:id)).order(created_at: :desc)
    end

    def new
        @tweet = Tweet.new()
    end

    def create
        tweet = current_user.tweets.new(params_tweet)
        if tweet.save()
            flash[:notice] = 'Tweet created successfully'
            redirect_to root_path
        else
            flash[:notice] = 'Tweet failed to create successfully'
            redirect_to root_path
        end
    end

    private

    def params_tweet
        params[:tweet].permit(:post)
    end

end
