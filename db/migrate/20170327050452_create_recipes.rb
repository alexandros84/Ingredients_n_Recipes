class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title, default: "My recipe"
      t.text :execution
      t.belongs_to :user

      t.timestamps
    end
  end
end
