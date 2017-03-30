class Ingredient < ApplicationRecord
  belongs_to :recipe
  
  def self.scope x
    Ingredient.where(recipe_id: x.id).order(quantity: :desc)
  end
  
end
