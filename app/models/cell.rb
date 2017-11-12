class Cell < ApplicationRecord
  belongs_to :player
  belongs_to :coordinate
  belongs_to :color, optional: true
  belongs_to :pip, optional: true

  def diagonals
    player.cells.where(coordinate: coordinate.diagonals)
  end

  def orthogonals
    player.cells.where(coordinate: coordinate.orthogonals)
  end

  def valid_dice placed_game_dice
    occupied or
      pip != placed_game_dice.pip or
      color != placed_game_dice.color or
      orthogonals.where(occupied: true).where(["pip = :pip or color = :color", {pip: placed_game_dice.pip, color: placed_game_dice.color}]).present? or
      (player.is_board_empty? and
          (coordinates.x == 0 or
              coordinates.y == 0 or
              coordinates.x == 4 or
              coordinates.y == 3)
      ) or
      (not player.is_board_empty? and
          (orthogonals.where(occupied: true).present? or
              diagonals.where(occupied: true).present?)
      )
  end
end
