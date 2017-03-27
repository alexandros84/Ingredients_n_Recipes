class RecipesController < ApplicationController
  
  def new 
    @recipe = Recipe.new
  end
  
  def create
    @recipe = current_user.recipes.build recipe_params
    @user = User.find_by(id: @recipe.user_id)
    if @recipe.save 
      flash[:success]= "Your recipe is ready!"
      redirect_to user_recipe_path @user, @recipe
    else
      flash[:danger]= "Something went wrong!"
      redirect_to new_recipe_path
    end
  end
  
  def show
    @recipe = Recipe.find_by(id: params[:id])
    @user = User.find_by(id: @recipe.user_id)
  end
  
  def index
    @recipes = current_user.recipes.all
  end
  
  def edit
    @recipe = Recipe.find_by(id: params[:id])
    @user = User.find_by(id: @recipe.user_id)
  end
  
  def destroy
  end
  
  def update
    @recipe = Recipe.find_by(id: params[:id])
    @user = User.find_by(id: @recipe.user_id)
      if @recipe.update_attributes(recipe_params)
        flash[:success] = "Recipe updated"
        redirect_to user_recipe_path(@user, @recipe)
      else
        flash[:danger]= "Something went wrong! Please try again."
        render 'edit'
      end
  end
  
  def custom_update
    @drawer = Drawer.find_by(id: current_user.drawers.first.id)
    @recipe = Recipe.find_by(id: params[:recipe_id])
    b=@recipe.attributes.to_a[2..13]
    c=@drawer.attributes.to_a[2..13]
    a=[]
    
    b.map!.with_index do |x,y|
        x[1]==0? x=nil : x=x[1] && a << y 
    end
    b.compact!
    
    phrase=c.map!.with_index do |c,y|
      (a.include? y)? c=c[0] : c=nil
    end
    c.compact!
    
    phrase=c.map!.with_index do |c,y|
      c="#{c}: @drawer.#{c}-@recipe.#{c}, "
    end
      
    phrase=phrase.join.split("").reverse.drop(2).reverse.join
    phrase="{"+phrase+"}"
    @drawer.update_attributes(eval(phrase))
    redirect_to current_user
  end
  
              private
            
                def recipe_params
                  params.require(:recipe).permit!
                end
  
  
end
