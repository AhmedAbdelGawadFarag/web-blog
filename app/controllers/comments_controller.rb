class CommentsController < ApplicationController

  def create
    postid = flash[:post_id]
    comment = Comment.new(params.require(:comment).permit("body"))
    comment.post_id = postid
    comment.save()

  end

end
