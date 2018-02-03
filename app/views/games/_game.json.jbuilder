json.id game.id
json.players do
  json.partial! 'players/player', collection: game.players, as: :player
end
json.game_dices (game.game_dices) do |game_dice|
  json.color game_dice.color
  json.pip game_dice.pip
  json.round game_dice.round
end
json.rounds (game.rounds) do |round|
  json.number round.round_number
  json.turns round.turns
end
json.url game_url(game, format: :json)
json.current_round_number game.current_round.round_number
