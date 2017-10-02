class CreateNeighbours < ActiveRecord::Migration[5.1]
  def change
    create_table :neighbours do |t|
      t.references :coordinate, foreign_key: true
      t.integer :neighbour_id

      t.timestamps
    end
  end
end
