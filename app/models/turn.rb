class Turn < ApplicationRecord
  belongs_to :player
  belongs_to :round
  belongs_to :game_dice, optional: true
  belongs_to :cell, optional: true
end
