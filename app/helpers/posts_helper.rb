module PostsHelper
    def liked?(post, user)
        # binding.pry
        if user_signed_in?
            like = Like.find_by(likeable_id: post.id, user_id: user.id ,likeable_type: Post.name)
        end 
    end

    def comment_liked?(comment, user)
        if user_signed_in? 
            like = Like.find_by(likeable_id: comment.id, user_id: user.id, likeable_type: Comment.name)
        end
    end
end
