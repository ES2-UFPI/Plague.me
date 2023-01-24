json.extract! game, :id, :banner_game, :title_game, :synopsis_game, :isforsale_game, :created_at, :updated_at
json.url game_url(game, format: :json)
