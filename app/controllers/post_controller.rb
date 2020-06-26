class PostController < ApplicationController

    get '/post/new' do
        erb :'posts/new'
    end

    post '/posts' do
       # binding.pry
       
        @filename = params[:file][:filename]
        file = params[:file][:tempfile]
        content = params[:content]
        @post= Post.create!(url:@filename, content: content)
        current_user.posts << @post

        File.open("./public/#{@post.url}", 'wb') do |f|
          f.write(file.read)
        end
        
        redirect to "/posts/#{@post.id}"

    end


    get '/posts/:id/edit' do
        
        @post = Post.find(params[:id])
        if current_user == @post.user
            erb :"posts/edit"
        else
            redirect "/profiles/#{current_user.slug}"
        end
    end

   

    get '/posts/:id' do
        @post = Post.find(params[:id])
        #binding.pry
        # puts "IMAGE #{@image.inspect}"
        erb :"posts/show"
    end

    delete '/posts/:id' do
        post = Post.find(params[:id])
        if current_user.posts.include?(post) && logged_in?
            post.delete
            redirect "/profiles/#{current_user.slug}"
        else
            redirect "/login"
        end
    end

    patch '/posts/:id' do
        @post = Post.find(params[:id])
        if current_user == @post.user
            @post.content = params[:content]
            @post.save
            redirect to "/posts/#{@post.id}"
        else
            redirect "/login"
        end
    end

end