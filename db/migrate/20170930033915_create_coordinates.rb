class CreateCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinates do |t|
      t.integer :x
      t.integer :y
      t.integer :neighbours, array: true

      t.timestamps
    end
  end
end
