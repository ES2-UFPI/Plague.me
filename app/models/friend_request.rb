class FriendRequest < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validate :only_one_pending_request
  validates :requester_id, uniqueness: { scope: :receiver_id }
  
  scope :pending, -> { where(status: 'pending') }
  scope :accepted, -> { where(status: 'accepted') }
  
  def accept
    update(status: true)
    receiver.friends << requester
    requester.friends << receiver
    requester.sent_friend_requests.destroy(self)
    receiver.received_friend_requests.destroy(self)
    destroy
  end

  def reject
    destroy
  end

  private

  def only_one_pending_request
    if self.class.exists?(requester: requester, receiver: receiver, status: 'pending')
      errors.add(:base, "Já existe uma solicitação de amizade pendente entre esses usuários.")
    end
  end

end
