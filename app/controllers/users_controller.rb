class UsersController < ApplicationController
    before_action :authenticate_user!
    def profile
        @user = User.find_by(:id => params[:id].to_i)
        if @user
            @followers = @user.followers.uniq
            @followings = @user.followings.uniq
        else
            flash[:notice] = 'User not found'
            redirect_to root_path
        end
    end
end
