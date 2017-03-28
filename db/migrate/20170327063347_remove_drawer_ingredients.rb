class RemoveDrawerIngredients < ActiveRecord::Migration[5.0]
  def change
    remove_column :ingredients, :drawer_id
  end
end
