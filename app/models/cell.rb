class Cell < ApplicationRecord
  belongs_to :player
  belongs_to :coordinate
  belongs_to :color, optional: true
  belongs_to :pip, optional: true

  def diagonals
    player.cells.where(coordinate: coordinate.neighbour_coordinates.where(neighbours: {direction: 'diagonal'}))
  end

  def orthogonals
    player.cells.where(coordinate: coordinate.neighbour_coordinates.where(neighbours: {direction: 'orthogonal'}))
  end
end
