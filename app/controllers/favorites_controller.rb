class FavoritesController < ApplicationController
  def create
  	@game = Game.find(params[:game_id])
  	@favorite = current_user.favorites.new(game_id: @game.id)
  	@favorite.save
    @game.create_notification_favorite!(current_user)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @favorite = current_user.favorites.find_by(game_id: @game.id)
    @favorite.destroy
  end
end
