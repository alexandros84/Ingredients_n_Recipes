class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
  end
  
  def create 
    @drawer = current_user.drawers.first
    @recipe = current_user.recipes.build(recipe_params)
      if @recipe.save
      flash[:success]= "Your recipe is ready!"
      a=(params[:ingredient_list]).to_s.scan(/\b\d{0,5}:\w{3,12}\b/)   
    a.each do |x|
      b=x.split(":")
      @ingredient = @recipe.ingredients.build(name: b[0], quantity: b[1].to_i, recipe_id: @recipe.id, 
      user_id: current_user.id)
if DrawerQuantity.where(["ingredient_name in (?)", ["#{b[0]}", "#{b[0]}".pluralize, "#{b[0]}".singularize]]).empty?
      @drawer.drawer_quantities.build(ingredient_name: b[0], quantity: 4*(b[1].to_i))
else
end
      end
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
  
  def custom_update
    @user = User.find_by(id: current_user)
    @recipe = Recipe.find_by(id: params[:id])
    @drawer = Drawer.find_by(id: params[:id])
    
    @recipe.ingredients.each do |x|


      @drawer_quantity = (DrawerQuantity.where(drawer_id: @drawer.id) && DrawerQuantity.where(ingredient_id: x.id))
      result = @drawer_quantity.quantity - x.quantity
      string="#{x.name}: #{result}"
      @drawer_quantity.update_attributes(eval(string))
    end
  
  end    
  
    private 
    
    def recipe_params
      params.require(:recipe).permit(:title, :execution, :user_id, :ingredient_list)
    end
end
