class RecipesController < ApplicationController

  before_action :check_logged_in
  before_action :check_if_authorized
  
  def new
    @user = User.find_by(id: params[:user_id])
    @recipe = Recipe.new
  end
  
  def create 
    @user = User.find_by(id: params[:user_id])
    @drawer = @user.drawers.first
    @recipe = current_user.recipes.build(recipe_params)
      if @recipe.save
      flash[:success]= "Your recipe is ready!"
      redirect_to user_path(current_user)
      else
      flash[:danger]= "Something went wrong!"
      redirect_to new_user_recipe_path(current_user, @recipe)
    end
  end
  
  def show 
    @user = User.find_by(id: params[:user_id])
    @recipe = Recipe.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:user_id])
    @recipe = Recipe.find_by(id: params[:id])
  end
  
  def update 
    @user = User.find_by(id: params[:user_id])
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update_attributes(recipe_params)
    redirect_to user_path(current_user)
  end
  
  def destroy
    @user = User.find_by(id: params[:user_id])
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to user_path current_user
  end
  
  def index
    @user = User.find_by(id: params[:user_id])
    posts = @user.recipes.all
        render json: {status: 'SUCCESS', message: 'Loaded all recipess', data: posts}, status: :ok
  end 
    
    def execute
      
      @user= User.find_by(id: params[:user_id])
      @drawer= Drawer.find_by(id: params[:drawer_id])
      @recipe= Recipe.find_by(id: params[:recipe_id])
      a= DrawerIngredient.where(drawer_id: @drawer.id)
      b= Ingredient.where(recipe_id: @recipe.id)
      
      b.each do |x|
        
        val_a = x.quantity
        instance = a.find_by(ingredient_name: x.name)
        val_b = instance.quantity
        
        instance.update_attributes(quantity: val_b - val_a )
      end
      
      redirect_to user_path(current_user)
      
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
    
    def recipe_params
      params.require(:recipe).permit(:title, :execution, :user_id, :ingredient_list)
    end
    
    end
