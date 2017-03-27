class Drawer < ApplicationRecord
  belongs_to :user 
  
  #def edible_attributes x
  #  @@ed_attr ||= "update_attributes(herbs: 4*current_user.recipes.maximum(:herbs), 
  #  salt: 4*current_user.recipes.maximum(:salt))"
  #end
  
  #def set_edible_attributes string
  #  @@ed_attr=string
  #  @@ed_attr
  #end
  
  #def update_edible_attributes instance
  #  a="update_attributes(herbs: 4*current_user.recipes.maximum(:herbs), 
  #  salt: 4*current_user.recipes.maximum(:salt))"
  #  set_edible_attributes a
  #  a
  #end
  
end
