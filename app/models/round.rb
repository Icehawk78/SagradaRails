class Round < ApplicationRecord
  belongs_to :game
  has_many :turns, dependent: :destroy
  has_many :game_dices

  def setup
    # Fetch the list of players from my game, and rotate it to get this round's start player
    players = game.players.to_a.rotate(round_number)

    # Then reverse it after, to build all of the turns
    turns = (players + players.reverse).map do |p|
      Turn.create(round: self, player: p)
    end

    self
  end
end
