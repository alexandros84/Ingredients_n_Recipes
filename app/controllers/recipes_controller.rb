class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
  end
  
  def create 
    @drawer = current_user.drawers.first
    @recipe = current_user.recipes.build(recipe_params)
      if @recipe.save
      flash[:success]= "Your recipe is ready!"
      redirect_to user_recipe_path(@recipe, current_user)
      else
      flash[:danger]= "Something went wrong!"
      redirect_to new_user_recipe_path(@recipe, current_user)
    end
  end
  
  def show 
    @recipe = Recipe.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
  end
  
  end    
  
    private 
    
    def recipe_params
      params.require(:recipe).permit(:title, :execution, :user_id, :ingredient_list)
    end
    
    end
