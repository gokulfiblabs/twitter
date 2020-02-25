class TweetsController < ApplicationController

    def index
        @tweets = current_user.followers.left_join(:tweets).pluck(:tweets)
    end

    def new
        @tweet = Tweet.new()
    end

    def create

    end

end
