class RemIngredientId < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :ingredient_id
  end
end
