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

  def current_turn
    turns.where(cell_id: nil).first
  end

  def draw_dices
    if game_dices.empty?

      number_of_dices = (game.players.size * 2) + 1

      game.game_dices.where(round: nil)
      .to_a
      .sample(number_of_dices)
      .each { |dice|
        dice.round = self
        dice.pip = Pip.all.to_a.sample
        dice.save
      }
    end
  end

end
