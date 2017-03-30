class Recipe < ApplicationRecord
  belongs_to :user 
  has_many :ingredients, dependent: :destroy
  
  after_create :create_new_drawer_ingredients
  after_create :create_recipe_ingredients
  after_update :update_addition_inventory
  after_update :update_add_ingredient_in_recipe
  after_update :update_take_ingredient_from_recipe
  after_update :update_quantity_existing_recipe_ingredient
  
  def create_new_drawer_ingredients
    @user = User.find_by(id: self.user_id)
    @drawer = Drawer.find_by(user_id: @user.id)
    a=self.ingredient_list.to_s.scan(/\b\w{3,12}: \d{0,5}\b/)
    #
    # To be replaced with .scan(/\b[a-zA-Z]{0,12}[ ]{0,1}[a-zA-Z]{0,12}[ ]{0,1}[a-zA-Z]{0,12}[ ]{0,1}[a-zA-Z]{3,12}: \d{0,5}\b/)
    # soon
    #
  a.each do |x|
    b=x.split(": ")
    assoc=DrawerIngredient.where(drawer_id: @drawer.id)
    assos=assoc.where(["ingredient_name in (?)", ["#{b[0]}", "#{b[0]}".pluralize, "#{b[0]}".singularize]])
if assos.empty? || assoc.nil?
    @drawer.drawer_ingredients.create(ingredient_name: b[0], quantity: 0)
else
end
  end
  end
  
  def create_recipe_ingredients
    @user = User.find_by(id: self.user_id)
    a=self.ingredient_list.downcase.scan(/\b\w{3,12}: \d{0,5}\b/)
  a.each do |x|
    b=x.split(": ")
    self.ingredients.create(name: b[0], quantity: b[1].to_i, user_id: @user.id, recipe_id: self.id)
  end
  end  
  
  def update_addition_inventory
    @user = User.find_by(id: self.user_id)
    @drawer = Drawer.find_by(user_id: @user.id)
    a=self.ingredient_list.to_s.scan(/\b\w{3,12}: \d{0,5}\b/)
  a.each do |x|
    b=x.split(": ")
    assoc=DrawerIngredient.where(drawer_id: @drawer.id)
    assos=assoc.where(["ingredient_name in (?)", ["#{b[0]}", "#{b[0]}".pluralize, "#{b[0]}".singularize]])
if assos.empty? || assoc.nil?
    @drawer.drawer_ingredients.create(ingredient_name: b[0], quantity: 0)
else
end
  end
  end
  
  def update_add_ingredient_in_recipe
    @user = User.find_by(id: self.user_id)
    a=self.ingredient_list.to_s.scan(/\b\w{3,12}: \d{0,5}\b/)
    d= Ingredient.where(recipe_id: self.id)
    d=d.to_a.map!{|x| x=x.name}
  a.each do |x|
    b=x.split(": ")
    if ((d.include? b[0]) || (d.include? b[0].singularize) || (d.include? b[0].pluralize))
    else
  self.ingredients.create(name: b[0], quantity: b[1].to_i, user_id: @user.id, recipe_id: self.id)
    end
  end  
  end
  
  def update_take_ingredient_from_recipe
    @user = User.find_by(id: self.user_id)
    a=self.ingredient_list.to_s.scan(/\b\w{3,12}: \d{0,5}\b/)
    d= Ingredient.where(recipe_id: self.id)
    e=d.to_a.map!{|x| x=x.name}
  a.map! do |x|
    b=x.split(": ")
    x=b[0]
  end
  e.each do |x|
    if !((a.include? x) || (d.include? x.singularize) || (d.include? x.pluralize))
      ingr_instance=d.find_by(name: x)
      ingr_instance.destroy
    else
    end
  end
  end
  
  def update_quantity_existing_recipe_ingredient
    @user = User.find_by(id: self.user_id)
    a=self.ingredient_list.to_s.scan(/\b\w{3,12}: \d{0,5}\b/)
    c=a.map do |x| 
      b=x.split(": ")
      x=[b[0], b[1]]
    end
    c.each do |x| 
      instance=Ingredient.find_by(name: x[0])
      instance.update_attributes(quantity: x[1])
    end
    
  end
        
end
