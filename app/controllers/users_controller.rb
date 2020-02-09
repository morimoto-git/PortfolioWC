class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def show
    @games = @user.games.order(created_at: "DESC")
    @favorites = @user.favorites.order(created_at: "DESC")
  end

  def edit
    if @user != current_user
      redirect_to user_path(@user)
    end
  end

  def update
  	if @user.update(user_params)
  	  redirect_to user_path(@user)
  	else
  	  render :edit
  	end
  end

  def destroy
  	@user.destroy
  	redirect_to root_path
  end

  private
    def user_params
       params.require(:user).permit(:name, :profile_image, :remove_profile_image)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
