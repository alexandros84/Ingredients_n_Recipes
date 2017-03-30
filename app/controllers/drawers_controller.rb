class DrawersController < ApplicationController
  
    def edit 
      @user=current_user
      @drawer=current_user.drawers.first
    end
    
    def update 
    @user = User.find_by(id: params[:id])
    @drawer = Drawer.find_by(id: params[:id])
    @drawer.update_attributes(drawer_params)
    redirect_to edit_user_drawer_path(@user, @drawer)
    end
    
    def go_shopping
    @user= current_user
    @drawer = current_user.drawers.first
    inventory_ingredients= DrawerIngredient.where(drawer_id: @drawer.id)
    inventory_ingredients_a=inventory_ingredients.to_a.map!{|x| x= [x.ingredient_name, x.quantity]}
    inventory_ingredients_a.each do |x|
      instance=inventory_ingredients.find_by(ingredient_name: x[0])
      if (instance.quantity<5000)
      instance.update_attributes(quantity: 5000)
      else
      end
    end
    redirect_to current_user
    
    end
    
    private
    
    def drawer_params
      params.require(:drawer).permit(:update_list)
    end
end
