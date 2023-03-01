class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_promotions
  has_many :promotions, through: :user_promotions
  has_many :reviews
  has_many :favorites, dependent: :destroy
  has_many :favorite_games, through: :favorites, source: :game
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
