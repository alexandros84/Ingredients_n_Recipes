class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.string :title, default: "My Inventory"
      t.integer :herbs, default: 0
      t.integer :salt, default: 0
      t.integer :pepper, default: 0
      t.integer :bananas, default: 0
      t.integer :chocolate, default: 0
      t.integer :meat, default: 0
      t.integer :greens, default: 0
      t.integer :olive_oil, default: 0
      t.integer :eggs, default: 0
      t.integer :butter, default: 0
      t.integer :tomatoes, default: 0
      t.integer :onions, default: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end
