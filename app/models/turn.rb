class Turn < ApplicationRecord
  belongs_to :player
  belongs_to :round
  belongs_to :game_dice, optional: true
  belongs_to :cell, optional: true

  def place_dice (placed_cell, placed_game_dice)
    if placed_cell.valid_dice(placed_game_dice)
      cell = placed_cell
      game_dice = placed_game_dice

      self.save
    end

    if round.current_turn.nil?
      current_round = round.game.current_round
      current_round.draw_dice unless current_round.nil?
    end
  end
end
