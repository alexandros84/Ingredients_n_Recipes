class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name, default: "nothing"
      t.belongs_to :recipe
      t.belongs_to :drawer

      t.timestamps
    end
  end
end
