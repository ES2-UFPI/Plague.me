class Game < ApplicationRecord
    belongs_to :publisher
    has_and_belongs_to_many :genres, join_table: :game_genres#, through: :game_genres
    accepts_nested_attributes_for :genres
    has_many :promotion_games
    has_many :promotions, through: :promotion_games
    has_many :game_genres
    has_many :genres, through: :game_genres
    accepts_nested_attributes_for :platforms
    has_and_belongs_to_many :platforms, join_table: :game_platforms#, through: :game_platforms
    belongs_to :developer
end
