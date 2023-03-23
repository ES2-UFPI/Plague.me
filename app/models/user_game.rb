class UserGame < ApplicationRecord
  validates :user, :game, presence: true
  belongs_to :user
  belongs_to :game
  enum status: [:on_going, :played]
end
