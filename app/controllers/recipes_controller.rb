class RecipesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @recipes = @user.recipes
    else
      @error = "That recipe doesn't exist" if params[:user_id]
      @recipes = Recipe.most_commented
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
    redirect_to recipes_path if !@recipe
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
    redirect_to recipes_path if !@recipe || @recipe.user != current_user
    @recipe.build_category if !@recipe.category
  end

  def update
    @recipe = Recipe.find_by_id(params[:id])
    redirect_to recipes_path if !@recipe || @recipe.user != current_user
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :image_url, :ingredients, :instructions, :category_id)
  end
end
