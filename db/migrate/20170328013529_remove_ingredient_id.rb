class RemoveIngredientId < ActiveRecord::Migration[5.0]
  def change
    remove_column :drawer_quantities, :ingredient_id
  end
end
