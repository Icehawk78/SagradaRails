class GameDice < ApplicationRecord
  belongs_to :game
  belongs_to :color
  belongs_to :pip, optional: true
  belongs_to :round, optional: true
end
