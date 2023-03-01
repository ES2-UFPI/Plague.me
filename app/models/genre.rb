class Genre < ApplicationRecord
    validates :name_genre, :description_genre, presence: true
    has_and_belongs_to_many :games, join_table: :game_genres
    #has_many :games, through: :game_genres
end
