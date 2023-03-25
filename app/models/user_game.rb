class UserGame < ApplicationRecord
  validates :user, :game, presence: true
  validates :game_id, uniqueness: { scope: :user_id }
  belongs_to :user
  belongs_to :game
  enum status: [:played, :playing, :unfinished]
end
