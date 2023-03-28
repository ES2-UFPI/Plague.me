json.extract! game, :id, :name_game, :description_game, :release, :rate_game, :franchise, :created_at, :updated_at
json.url game_url(game, format: :json)
