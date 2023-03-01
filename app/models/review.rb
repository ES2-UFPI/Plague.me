class Review < ApplicationRecord
  validates :score, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 10.0 }
  belongs_to :game
end
