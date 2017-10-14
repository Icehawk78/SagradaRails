class Coordinate < ApplicationRecord
  has_many :neighbours
  has_many :neighbour_coordinates, through: :neighbours

  def diagonals
    neighbour_coordinates.where(neighbours: {direction: 'diagonal'})
  end

  def orthogonals
    neighbour_coordinates.where(neighbours: {direction: 'orthogonal'})
  end
end
