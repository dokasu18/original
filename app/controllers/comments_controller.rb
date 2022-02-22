class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to menu_path(@comment.menu)
    else
      @menu = @comment.menu
      @comments = @menu.comments
      render "menus/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, menu_id: params[:menu_id])
  end
end
