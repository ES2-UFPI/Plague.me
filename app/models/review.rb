class Review < ApplicationRecord
  validates :score, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 10.0 }
  validates :user_id, uniqueness: { scope: :game_id }
  belongs_to :game
  belongs_to :user
end
