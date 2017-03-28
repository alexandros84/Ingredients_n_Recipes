class DrawersController < ApplicationController
  
    def edit 
      @user=current_user
      @drawer=current_user.drawers.first
    end
    
    def update 
    @user = User.find_by(id: params[:id])
    @drawer = Drawer.find_by(id: params[:id])
    @drawer.update_attributes(update_list: params[:update_list])
    redirect_to edit_user_drawer_path(@user, @drawer)
    end
    
    def go_shopping
    
    @drawer = Drawer.find_by(id: current_user.drawers.first.id)
    @recipe = Recipe.find_by(id: params[:recipe_id])
    
    b=@drawer.attributes.to_a[2..13]
    phrase=b.map!{|p|
      "#{p[0]}: 4*current_user.recipes.maximum(:#{p[0]}), "}
    phrase=phrase.join.split("").reverse.drop(2).reverse.join
    phrase="{"+phrase+"}"
    @drawer.update_attributes(eval(phrase))
   
    redirect_to current_user
    
    end
    
    private
    
    def drawer_params
      params.require(:drawer).permit(:update_list)
    end
end
