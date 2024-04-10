module PostsHelper
    def liked?(post, user)
        # binding.pry
        if user_signed_in?
            like = Like.find_by(post_id: post.id, user_id: user.id)
        end 
    end
end
