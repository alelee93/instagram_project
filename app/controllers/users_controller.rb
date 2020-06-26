class UsersController < ApplicationController

    get '/profiles/:slug' do
        @user = User.find_by_slug(params[:slug])
        #@user = User.find(params[:id])
        erb :'users/show'
    end

    get '/profiles' do
        erb :'users/index'
    end

    get '/profiles/:slug/edit' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/edit'
    end

    patch '/profiles/:slug' do
        user = User.find_by_slug(params[:slug])
        user.name = params[:name]
        user.email = params[:email]
        user.username = params[:username]
        user.bio = params[:bio]
        user.save

        redirect "/profiles/#{user.slug}"
    end

end