class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_promotions
  has_many :collections, dependent: :destroy
  has_many :promotions, through: :user_promotions
  has_many :reviews
  has_many :favorites, dependent: :destroy
  has_many :favorite_games, through: :favorites, source: :game
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

end
