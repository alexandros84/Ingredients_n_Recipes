class AddIngredientRefToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :ingredient, foreign_key: true
  end
end
