class DrawerIngredient < ApplicationRecord
  belongs_to :drawer
  
  def self.of x
    DrawerIngredient.where(drawer_id: x.id)
  end
  
end
