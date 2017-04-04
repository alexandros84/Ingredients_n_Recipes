class Drawer < ApplicationRecord
  belongs_to :user
  has_many :drawer_ingredients
  
  after_update :update_drawer
  
  def update_drawer
    a=self.update_list.to_s.scan(/\b[a-z -]{3,40}: \d{1,6}\b/)
  a.each do |x|
    b=x.split(": ")
    assoc=DrawerIngredient.where(drawer_id: self.id)
    instance=assoc.find_by(ingredient_name: b[0])
    instance.update_attributes(quantity: b[1].to_i)
  end
  
  end
    
  
end
