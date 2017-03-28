class Recipe < ApplicationRecord
  belongs_to :user 
  has_many :ingredients
  
  after_create :create_new_drawer_ingredients
  after_create :create_recipe_ingredients
  
  def create_new_drawer_ingredients
    @user = User.find_by(id: self.user_id)
    @drawer = Drawer.find_by(user_id: @user.id)
    a=self.ingredient_list.to_s.scan(/\b\d{0,5}:\w{3,12}\b/)
  a.each do |x|
    b=x.split(":")
    assoc=DrawerIngredient.where(drawer_id: @drawer.id)
    assos=assoc.where(["ingredient_name in (?)", ["#{b[1]}", "#{b[1]}".pluralize, "#{b[1]}".singularize]])
if assos.empty? || assoc.nil?
    @drawer.drawer_ingredients.create(ingredient_name: b[1], quantity: 0)
else
end
  end
  end
  
  def create_recipe_ingredients
    @user = User.find_by(id: self.user_id)
    a=self.ingredient_list.to_s.scan(/\b\d{0,5}:\w{3,12}\b/)
  a.each do |x|
    b=x.split(":")
    self.ingredients.create(name: b[1], quantity: b[0].to_i, user_id: @user.id, recipe_id: self.id)
  end
  end  
        
end
