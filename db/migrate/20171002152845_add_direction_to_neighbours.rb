class AddDirectionToNeighbours < ActiveRecord::Migration[5.1]
  def change
    add_column :neighbours, :direction, :string
  end
end
