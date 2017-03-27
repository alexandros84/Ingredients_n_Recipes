class DrawersController < ApplicationController
  
    def go_shopping_you_fool
    
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
  
  
end
