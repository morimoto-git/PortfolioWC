class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
  	@game = Game.find(params[:game_id])
  	@comment = current_user.comments.new(comment_params)
  	@comment.game_id = @game.id
  	@comment.save
  	redirect_back fallback_location: root_path
  end

  def destroy
    @comment = Comment.find(params[:game_id])
	  @comment.destroy
	  redirect_back fallback_location: root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :game_id, :content)
  end
end
