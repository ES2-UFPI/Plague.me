class Platform < ApplicationRecord
    validates :name_platform, :description_platform, presence: true
    has_and_belongs_to_many :games, join_table: :game_platforms
    #has_many :games, through: :game_platforms
end
