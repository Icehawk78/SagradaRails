json.extract! game, :id, :players, :game_dices, :rounds, :created_at, :updated_at
json.url game_url(game, format: :json)
