class RemoveNeighboursFromCoordinate < ActiveRecord::Migration[5.1]
  def change
    remove_column :coordinates, :neighbours, :integer
  end
end
