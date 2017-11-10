class Game < ApplicationRecord
  ROUNDS = 10
  has_many :players, dependent: :destroy
  has_many :game_dices, dependent: :destroy
  has_many :rounds, dependent: :destroy

  def setup users
    # Create all available dice for the game
    colors = Color.all
    color_sets = ((users.size * 20.0 + ROUNDS) / colors.size).ceil
    game_dices = (color_sets).times.flat_map do
      colors.map do |c|
        GameDice.create(game: self, color: c)
      end
    end

    # Next create players
    players = users.map.with_index do |u, i|
      goal = colors.sample
      colors -= [goal]
      p = Player.create(game: self, color: goal, user: u, order: i)
      p.setup
    end

    # Finally create rounds
    rounds = ROUNDS.times.map do |number|
      r = Round.create(game: self, round_number: number)
      r.setup
    end

    # Draw dice for the first round
    current_round.draw_dices

    self
  end

  def current_round
    rounds.joins(:turns).where(turns: {cell_id:nil}).first
  end
end
