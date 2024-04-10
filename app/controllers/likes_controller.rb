class LikesController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        current_user.like!(@post)
    end

    def destroy
        # binding.pry
        @post = Post.find_by(id: params[:post_id]) 
        current_user.likes.where(post_id: @post.id).delete_all
    end
end