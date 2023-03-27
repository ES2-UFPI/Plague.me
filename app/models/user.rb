class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_promotions
  has_many :collections, dependent: :destroy
  has_many :promotions, through: :user_promotions
  has_many :reviews
  has_many :favorites, dependent: :destroy
  has_many :favorite_games, through: :favorites, source: :game
  has_many :wishlists, dependent: :destroy
  has_many :wishlist_games, through: :wishlists, source: :game
  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user    
  
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'requester_id', dependent: :destroy
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'receiver_id', dependent: :destroy

  def friendship_with(other_user)
    Friendship.find_by(user: self, friend: other_user) || Friendship.find_by(user: other_user, friend: self)
  end
  
  def recommended_games
    friend_ids = friendships.pluck(:friend_id)
    friend_favorite_game_ids = Favorite.where(user_id: friend_ids).pluck(:game_id)
    excluded_game_ids = game_ids + favorite_games.pluck(:id)
    Game.where(id: friend_favorite_game_ids).where.not(id: excluded_game_ids + user_games.pluck(:game_id))
  end

end
