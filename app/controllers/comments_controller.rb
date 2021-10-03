# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      flash.now[:alert] = t('comment.errors.create', name: Comment.model_name.human)
      render @template
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
