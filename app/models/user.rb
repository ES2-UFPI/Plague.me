class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_promotions
  has_many :promotions, through: :user_promotions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
