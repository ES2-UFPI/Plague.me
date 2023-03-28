class FriendshipsController < ApplicationController
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.remove_friendship
    redirect_to current_user, notice: 'Amizade removida com sucesso!'
  end
end
