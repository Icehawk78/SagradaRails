class Coordinate < ApplicationRecord
  has_many :neighbours
  has_many :neighbour_coordinates, through: :neighbours
end
