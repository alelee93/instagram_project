class FollowsController < ApplicationController

    post "/:slug/follow" do
        follow_this_user = User.find_by_slug(params[:slug])
        current_user.follows(follow_this_user)
        redirect "/profiles"
    end

    post "/:slug/unfollow" do
        #binding.pry
        unfollow_this_user = User.find_by_slug(params[:slug])
        current_user.following.delete(unfollow_this_user) 
        redirect "/profiles"
    end

    get "/:slug/followers" do
        @user = User.find_by_slug(params[:slug])
        erb :"/follows/followers"
    end

    get "/:slug/following" do
        @user = User.find_by_slug(params[:slug])
        erb :"/follows/following"
    end

end