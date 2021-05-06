class CommentsController < ApplicationController
  def index
    # then it's nested
    if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
      @comments = @recipe.comments
    else
      # it's @error and not flash because of redirect, But why. Source video 3 25:00
      @error = "That Recipe Doesn't Exist" if params[:recipe_id]
      @comments = Comment.all
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:recipe_id, :content)
  end
end
