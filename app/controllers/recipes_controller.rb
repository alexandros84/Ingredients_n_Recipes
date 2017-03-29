class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
  end
  
  def create 
    @drawer = current_user.drawers.first
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
    @recipe = Recipe.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
  end
  
  def edit
    @user= current_user
    @recipe = Recipe.find_by(id: params[:id])
  end
  
  def update 
    @user= current_user
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update_attributes(recipe_params)
    redirect_to user_path(current_user)
  end
  
  def destroy
    @user= current_user
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to user_path current_user
  end
  
    def execute
      @user= User.find_by(id: params[:user_id])
      @drawer= Drawer.find_by(id: params[:drawer_id])
      @recipe= Recipe.find_by(id: params[:recipe_id])
      a= DrawerIngredient.where(drawer_id: @drawer.id)
      b= Ingredient.where(recipe_id: @recipe.id)
      c= a.to_a.map{|x| x.ingredient_name } 
      d= b.to_a.map{|x| x.name }
      c.map! do |x| 
        if ((d.include? x) || (d.include? x.singularize) || (d.include? x.pluralize)) 
        x
        else
        end
      end
      c.compact!
      number=c.length
      f=[]
      (1..number).each do |x|
        f << [c[x-1], d[x-1]]
      end
      (1..number).each do |c|
        r_i_i= b.find_by(name: f[c-1][1])
        recipe_value=r_i_i.quantity
        s_i_i= a.find_by(ingredient_name: f[c-1][0])
        stock_value=s_i_i.quantity
        s_i_i.update_attributes(quantity: stock_value - recipe_value)
      end
      redirect_to user_path(current_user)
    end
  
    private 
    
    def recipe_params
      params.require(:recipe).permit(:title, :execution, :user_id, :ingredient_list)
    end
    
    end
