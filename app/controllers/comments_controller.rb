class CommentsController < ApplicationController
  def create

    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.dish
    else
      # redirect_to :back, flash: {
      #   comment: comment,
      #   error_messages: comment.errors.full_messages
      # }
      flash[:comment] = comment
      flash[:error_messages] = comment.errors.full.messages
      redirect_back fall_location: comment.dish
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:dish_id, :name, :comment)
  end

end
