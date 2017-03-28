class AddRecipeId < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :ingredient_list, :text, default: "Some of this n' some of that."
  end
end
