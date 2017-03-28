class AddquantityIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :quantity, :integer, default: 0
  end
end
