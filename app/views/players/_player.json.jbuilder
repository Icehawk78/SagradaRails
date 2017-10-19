json.id player.id
json.user player.user
json.color player.color
json.board (player.board) do |row|
  json.partial! 'cells/cell', collection: row, as: :cell
end
json.url player_url(player, format: :json)
