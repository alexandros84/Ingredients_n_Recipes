class DropDrawerQuantities < ActiveRecord::Migration[5.0]
  def change
    drop_table :drawer_quantities
  end
end
