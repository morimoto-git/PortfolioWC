class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @games = @user.games.order(created_at: "DESC")
    @favorites = @user.favorites.order(created_at: "DESC")
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  redirect_to user_path(@user)
  	else
  	  render :edit
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to root_path
  end

  private
    def user_params
       params.require(:user).permit(:name, :profile_image, :remove_profile_image)
    end
end
