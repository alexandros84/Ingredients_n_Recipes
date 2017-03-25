class DrawersController < ApplicationController
  
  def go_shopping_you_fool
    @drawer = Drawer.find_by(id: current_user.drawers.first.id)
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @drawer.update_attributes(herbs: @drawer.herbs+1000, salt: @drawer.salt+1000)
    redirect_to current_user
  end
  
  
end
