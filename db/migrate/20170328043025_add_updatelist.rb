class AddUpdatelist < ActiveRecord::Migration[5.0]
  def change
    add_column :drawers, :update_list, :text, default: "No updates yet."
  end
end
