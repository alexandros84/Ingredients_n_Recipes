class AddingIngredientNameToDrawer < ActiveRecord::Migration[5.0]
  def change
    add_column :drawer_quantities, :ingredient_name, :string, default: "nothing in"
  end
end
