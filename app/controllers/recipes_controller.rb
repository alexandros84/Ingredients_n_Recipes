class RecipesController < ApplicationController
  
  def new 
    @recipe = Recipe.new
  end
  
  def create
    @recipe = current_user.recipes.build recipe_params
    @user = User.find_by(id: @recipe.user_id)
    if @recipe.save 
      flash[:success]= "Your recipe is ready!"
      redirect_to user_recipe_path @user, @recipe
    else
      flash[:danger]= "Something went wrong!"
      redirect_to new_recipe_path
    end
  end
  
  def show
    @recipe = Recipe.find_by(id: params[:id])
    @user = User.find_by(id: @recipe.user_id)
  end
  
  def index
    @recipes = current_user.recipes.all
  end
  
  def edit
    @recipe = Recipe.find_by(id: params[:id])
    @user = User.find_by(id: @recipe.user_id)
  end
  
  def destroy
  end
  
  def update
    @recipe = Recipe.find_by(id: params[:id])
    @user = User.find_by(id: @recipe.user_id)
      if @recipe.update_attributes(recipe_params)
        flash[:success] = "Recipe updated"
        redirect_to user_recipe_path(@user, @recipe)
      else
        flash[:danger]= "Something went wrong! Please try again."
        render 'edit'
      end
  end
  
              private
            
                def recipe_params
                  params.require(:recipe).permit!
                end
  
  
end
