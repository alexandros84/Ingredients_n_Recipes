class DrawerIngredientsController < ApplicationController
  
    def new
      @drawer= current_user.drawers.first
      @drawer_ingredient= @drawer.drawer_ingredients.new
    end
    
    def create
      @drawer= current_user.drawers.first
      @drawer_ingredient=@drawer.drawer_ingredients.build(drawer_ingredient_params)
      @drawer.drawer_ingredients.create(drawer_ingredient_params)
      redirect_to edit_user_drawer_path(current_user, @drawer)
    end
  
    def edit 
      @drawer = @drawer= current_user.drawers.first
      @drawer_ingredient = DrawerIngredient.find_by(id: params[:id])
    end
    
    def update
      @drawer = @drawer= current_user.drawers.first
      @drawer_ingredient = DrawerIngredient.find_by(id: params[:id])
      @drawer_ingredient.update_attributes(drawer_ingredient_params)
      flash[:success] = "Ingredient updated"
      redirect_to edit_user_drawer_path(current_user, @drawer)
    end
    
    def destroy
      @drawer= current_user.drawers.first
      @drawer_ingredient=DrawerIngredient.find_by(id: params[:id])
      @drawer_ingredient.destroy
      redirect_to user_path(current_user)
    end
    
    private
    
    def drawer_ingredient_params
      params.require(:drawer_ingredient).permit(:ingredient_name)
    end
      
    
  end
