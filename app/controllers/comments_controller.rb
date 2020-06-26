class CommentsController < ApplicationController
    post "/:slug/:post_id/comments" do 
        #binding.pry
       post = Post.find(params[:post_id])
       comment = params[:comment]
       current_user.comment_on_post(post, comment)
       redirect to "/posts/#{post.id}"
    end

    get "/comments/:id/edit" do
        #binding.pry
        @comment = Message.all.find(params[:id])
        erb :"/comments/edit"
    end

    patch "/comments/:id" do
        comment = Message.find(params[:id])
        comment.content = params[:content]
        comment.save
        redirect to "/posts/#{comment.messageable_id}"
    end


    delete '/comments/:id' do
        comment = Message.find(params[:id])
        post_id = comment.messageable_id
        if comment.sender_id == current_user.id && logged_in?
            comment.delete
            redirect to "/posts/#{post_id}"
        else
            redirect "/login"
        end
    end

end


# def comment_on_post(post, comment)
#     Message.create(sender_id: self.id, content: comment, messageable_id: post.id, messageable_type: 'Post')
# end