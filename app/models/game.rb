class Game < ApplicationRecord
    belongs_to :publisher
    #has_many :game_genres
    has_and_belongs_to_many :genres, join_table: :game_genres#, through: :game_genres
    accepts_nested_attributes_for :genres
    #has_many :game_platforms
    has_and_belongs_to_many :platforms, join_table: :game_platforms#, through: :game_platforms
    accepts_nested_attributes_for :platforms
    belongs_to :developer
end
