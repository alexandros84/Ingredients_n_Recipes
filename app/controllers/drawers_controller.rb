class DrawersController < ApplicationController
  
    #def number_a 
    #  @@number_a
    #end
  
    #def number_a x
    #  @@number_a.nil? ? @@number_a = x.attributes.count : @@number_a
    #end
  
    #def set_number_a(instance, variable)
    #  number_a(instance)==variable 
    #end
  
  def go_shopping_you_fool
    
    @drawer = Drawer.find_by(id: current_user.drawers.first.id)
    @recipe = Recipe.find_by(id: params[:recipe_id])
    #a=@drawer.attributes.count
  
      #if a==number_a(@drawer)
        
    #@drawer.send :edible_attributes, @drawer
    @drawer.update_attributes(herbs: 4*current_user.recipes.maximum(:herbs), 
    salt: 4*current_user.recipes.maximum(:salt))
    redirect_to current_user
    
      #else
        
    #@drawer.send :update_edible_attributes, @drawer
    #set_number_a(@drawer, a)
    #redirect_to current_user
      #end
  end
  
  
end
