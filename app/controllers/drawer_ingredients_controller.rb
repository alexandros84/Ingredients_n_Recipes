class DrawerIngredientsController < ApplicationController
  
  before_action :check_logged_in
  before_action :check_if_authorized
  
    def new
      @drawer= Drawer.find_by(id: params[:drawer_id])
      @drawer_ingredient= @drawer.drawer_ingredients.new
    end
    
    def create
      @drawer= Drawer.find_by(id: params[:drawer_id])
      @user = User.find_by(id: @drawer.user_id)
      @drawer_ingredient=@drawer.drawer_ingredients.build(drawer_ingredient_params)
      @drawer.drawer_ingredients.create(drawer_ingredient_params)
      redirect_to edit_user_drawer_path(current_user, @drawer)
    end
  
    def edit 
      @drawer= Drawer.find_by(id: params[:drawer_id])
      @user = User.find_by(id: @drawer.user_id)
      @drawer_ingredient = DrawerIngredient.find_by(id: params[:id])
    end
    
    def update
      @drawer= Drawer.find_by(id: params[:drawer_id])
      @user = User.find_by(id: @drawer.user_id)
      @drawer_ingredient = DrawerIngredient.find_by(id: params[:id])
      @drawer_ingredient.update_attributes(drawer_ingredient_params)
      flash[:success] = "Ingredient updated"
      redirect_to edit_user_drawer_path(current_user, @drawer)
    end
    
    def destroy
      @drawer= Drawer.find_by(id: params[:drawer_id])
      @user = User.find_by(id: @drawer.user_id)
      @drawer_ingredient=DrawerIngredient.find_by(id: params[:id])
      @drawer_ingredient.destroy
      redirect_to edit_user_drawer_path(@user, @drawer)
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
      @drawer = Drawer.find_by(id: params[:drawer_id])
      @user = User.find_by(id: @drawer.user_id)
      if @user == current_user
      else
        redirect_to root_path
        flash[:danger] = "It doesn't seem you are authorized to take this action."
      end
    end
    
    def drawer_ingredient_params
      params.require(:drawer_ingredient).permit(:ingredient_name, :quantity)
    end
      
    
  end
