class Turn < ApplicationRecord
  belongs_to :player
  belongs_to :round
  belongs_to :game_dice
  belongs_to :cell
end
