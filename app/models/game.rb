class Game < ApplicationRecord
    belongs_to :publisher
    has_many :promotion_games
    has_many :promotions, through: :promotion_games
    has_many :game_genres
    has_many :genres, through: :game_genres
    has_many :game_platforms
    has_many :platforms, through: :game_platforms
    belongs_to :developer
end
