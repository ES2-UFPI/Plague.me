class Game < ApplicationRecord
    belongs_to :publisher
    has_and_belongs_to_many :genres, join_table: :game_genres
    accepts_nested_attributes_for :genres
    has_many :promotion_games
    has_many :promotions, through: :promotion_games
    has_and_belongs_to_many :platforms, join_table: :game_platforms
    accepts_nested_attributes_for :platforms
    belongs_to :developer
end
