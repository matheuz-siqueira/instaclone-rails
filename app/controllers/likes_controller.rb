class LikesController < ApplicationController
    before_action :find_post 
    before_action :find_comment 
    def create
        @post = Post.find(params[:post_id])
        @post.likes.create(likeable_id: @post.id, user_id: current_user.id, likeable_type: Post.name)
    end

    def destroy
        @post = Post.find_by(id: params[:post_id]) 
        @post.likes.where(likeable_id: @post.id, user_id: current_user.id, likeable_type: Post.name)
            .delete_all
    end

    def create_comments_like
        @comment = Comment.find_by(id: params[:comment_id])
        @comment.likes
            .create(likeable_id: @comment.id, user_id: current_user.id, likeable_type: Comment.name)
    end
    
    def destroy_comments_like
        @comment = Comment.find_by(id: params[:comment_id]) 
        @comment.likes.where(likeable_id: @comment.id, user_id: current_user.id, likeable_type: Comment.name)
            .delete_all
    end

    private 

        def find_post 
            @post = Post.find_by(id: params[:post_id])
        end

        def find_comment 
            @comment = Comment.find_by(id: params[:comment_id])
        end
end