class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :color
  has_many :cells, -> { includes :coordinate }, dependent: :destroy

  default_scope { order(order: :asc) }

  def setup
    cells = Coordinate.all.map do |c|
      Cell.create(player: self, coordinate: c)
    end
  end

  def board
    cells.to_a.group_by {|cell|
      cell.coordinate.y
    }.map{|y, cells|
      cells.sort_by {|cell|
        cell.coordinate.x
      }
    }
  end

end
