class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
	@categories = Category.all.order(id: "DESC")
	@category = Category.new
  end

  def edit
	@category = Category.find(params[:id])
  end

  def create
	@category = Category.new(category_params)
	if @category.save
	  redirect_to categories_path
	else
	  @categories = Category.all.order(id: "DESC")
	  render :index
	end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
  	  redirect_to categories_path
    else
  	  render :edit
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
