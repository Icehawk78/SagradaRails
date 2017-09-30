class CreateCells < ActiveRecord::Migration[5.1]
  def change
    create_table :cells do |t|
      t.references :player, foreign_key: true
      t.references :coordinate, foreign_key: true
      t.references :color, foreign_key: true
      t.references :pip, foreign_key: true
      t.boolean :occupied, default: false, null: false

      t.timestamps
    end
  end
end
