class CreateDrawers < ActiveRecord::Migration[5.0]
  def change
    create_table :drawers do |t|
      t.string :my_inventory, default: "My inventory"
      t.belongs_to :user

      t.timestamps
    end
  end
end
