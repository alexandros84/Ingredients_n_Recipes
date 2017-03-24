class AddExecutRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :execution, :text, default: "Throw it all in a cauldron and hope for the best!"
  end
end
