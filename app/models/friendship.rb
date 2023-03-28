class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :friend_id, uniqueness: { scope: :user_id }

  def self.create_from_request(request)
    create(user_id: request.user_id, friend_id: request.friend_id, status: 'aceito')
  end

  def remove_friendship
    user.friends.destroy(friend)
    friend.friends.destroy(user)
    destroy
  end
  
end
