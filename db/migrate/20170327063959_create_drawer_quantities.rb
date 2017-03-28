class CreateDrawerQuantities < ActiveRecord::Migration[5.0]
  def change
    create_table :drawer_quantities do |t|
      t.references :ingredient, foreign_key: true
      t.integer :quantity, default: 0
      t.belongs_to :drawer

      t.timestamps
    end
  end
end
