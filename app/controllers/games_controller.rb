class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @games = Game.search(params[:search]).order(created_at: "DESC")
  end

  def show
  	@game = Game.find(params[:id])
    @comment = Comment.new
    @comments = @game.comments.order(created_at: "DESC")
  end

  def ranking
    @fav_rank = Game.find(Favorite.group(:game_id).order("count(game_id) desc").limit(10).pluck(:game_id))
    @cmt_rank = Game.find(Comment.group(:game_id).order("count(game_id) desc").limit(10).pluck(:game_id))
  end

  def new
  	@game = Game.new
  	@game.game_rules.build
  end

  def create
  	@game = Game.new(game_params)
  	@game.user_id = current_user.id
  	if @game.save
  	  redirect_to game_path(@game)
  	else
  	  render :new
  	end
  end

  def edit
  	@game = Game.find(params[:id])
  	if @game.user_id != current_user.id
  	  redirect_to game_path(@game)
  	end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
  	  redirect_to game_path(@game)
    else
  	  render :edit
    end
  end

  def destroy
  	@game = Game.find(params[:id])
  	@game.destroy
  	redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:user_id, :category_id, :title, :main_image, :remove_main_image, :content, :player, :playing_time, :level, game_rules_attributes: [:id, :image, :text, :_destroy])
  end
end
