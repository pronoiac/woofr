class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to user_image_url(@comment.image_user_id, @comment.image_id)
    else
      # TODO: actually write this.
      flash.now[:errors] = @comment.errors.full
      redirect_to new_post_comment_url(@comment.post_id)
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :image_id, :image_user_id)
  end
end
