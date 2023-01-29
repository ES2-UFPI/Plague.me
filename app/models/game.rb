class Game < ApplicationRecord
    belongs_to :publisher
    has_many :game_genres
    has_many :genres, through: :game_genres
    has_many :game_platforms
    has_many :platforms, through: :game_platforms
    belongs_to :developer
end
