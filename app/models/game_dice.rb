class GameDice < ApplicationRecord
  belongs_to :game
  belongs_to :color
  belongs_to :pip
  belongs_to :round
end
