class CreateDrawerIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :drawer_ingredients do |t|
      t.integer  "quantity",        default: 0
      t.integer  "drawer_id"
      t.datetime "created_at",                             null: false
      t.datetime "updated_at",                             null: false
      t.string   "ingredient_name", default: "nothing in"
      t.index ["drawer_id"], name: "index_drawer_quantities_on_drawer_id"

      t.timestamps
    end
  end
end
