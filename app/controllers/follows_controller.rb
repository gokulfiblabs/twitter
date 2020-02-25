class FollowsController < ApplicationController
    before_action :authenticate_user!
    def follow
        if(current_user.follower_relationship.pluck(:follower_id).include?(params[:id]))
            flash[:notice] = 'Already following'
        else
            follower = current_user.follower_relationship.new()
            follower.follower_id = params[:id]
            follower.save()
            flash[:notice] = 'Followed successfully'
        end
        redirect_to root_path
    end

    def unfollow
        follow = current_user.follower_relationship.find_by(:follower_id => params[:id].to_i)
        if follow
            follow.delete()
            flash[:notice] = 'Unfollowed successfully'
            redirect_to root_path
        else
            flash[:notice] = 'Cannot unfollow user'
            redirect_to root_path
        end
    end

end
