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

end
