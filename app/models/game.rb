class Game < ApplicationRecord
    validates :name_game, :description_game, presence: true
    validates :rate_game, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 10.0 }

    belongs_to :publisher
    has_and_belongs_to_many :genres, join_table: :game_genres
    accepts_nested_attributes_for :genres
    has_many :promotion_games
    has_many :promotions, through: :promotion_games
    has_and_belongs_to_many :platforms, join_table: :game_platforms
    accepts_nested_attributes_for :platforms
    belongs_to :developer
    has_many :reviews, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorited_by, through: :favorites, source: :user
    has_many :collection_items, dependent: :destroy
    has_many :collections, through: :collection_items

    def calculate_average_rating
        reviews.average(:score).to_f.round(1)
      end
      
end
