class DrawersController < ApplicationController
  
  before_action :check_logged_in
  before_action :check_if_authorized
  
    def edit 
      @user = User.find_by(id: params[:user_id])
      @drawer=current_user.drawers.first
    end
    
    def update 
      @user = User.find_by(id: params[:user_id])
      @drawer = Drawer.find_by(id: params[:id])
      @drawer.update_attributes(drawer_params)
      redirect_to edit_user_drawer_path(@user, @drawer)
    end
    
    def go_shopping
      @user = User.find_by(id: params[:user_id])
      @drawer = current_user.drawers.first
      inventory_ingredients = DrawerIngredient.where(drawer_id: @drawer.id)
      recipe_ingredients = Ingredient.where(user_id: @user.id)
      inventory_ingredients.each do |x|
        instance_a = inventory_ingredients.find_by(ingredient_name: x.ingredient_name)
        value = recipe_ingredients.where(name: x.ingredient_name).order(quantity: :desc).first.quantity
        if ((4*value)>(x.quantity))
      instance_a.update_attributes(quantity: 4*value)
        else
        end
      end  
      redirect_to current_user
    end
    
    private
    
    def check_logged_in
      if current_user.nil?
      flash[:danger] = "Please Signup/Log in first."
      redirect_to root_path
      else
      end
    end 
    
    def check_if_authorized
      @user = User.find_by(id: params[:user_id])
      if @user == current_user
      else
        redirect_to root_path
        flash[:danger] = "It doesn't seem you are authorized to take this action."
      end
    end
    
    def drawer_params
      params.require(:drawer).permit(:update_list)
    end
end
