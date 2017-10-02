class Neighbour < ApplicationRecord
  belongs_to :start_coordinate, class_name: 'Coordinate', foreign_key: 'coordinate_id'
  belongs_to :neighbour_coordinate, class_name: 'Coordinate', foreign_key: 'neighbour_id'
end
