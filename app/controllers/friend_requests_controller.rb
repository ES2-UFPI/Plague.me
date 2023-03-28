class FriendRequestsController < ApplicationController
    before_action :authenticate_user!

    def show
    end

    def create
      @user = User.find(params[:user_id])
      @friend_request = current_user.sent_friend_requests.build(receiver: @user)
      @friend_request.status = 'pending'
  
      if @friend_request.save
        redirect_to @user, notice: 'Solicitação de amizade enviada com sucesso!'
      else
        redirect_to @user, alert: 'Não foi possível enviar solicitação de amizade.'
      end
    end

    def accept
      @friend_request = current_user.received_friend_requests.pending.find_by(id: params[:id])  
      if @friend_request
        @friend_request.accept
        redirect_to current_user, notice: 'Solicitação de amizade aceita!'
      else
        redirect_to current_user, alert: 'Solicitação de amizade não encontrada.'
      end
    end

    def destroy
        @friend_request = FriendRequest.find(params[:id])
        @friend_request.reject
        redirect_to current_user
    end

    private

    def friend_request_params
        params.require(:friend_request).permit(:receiver_id)
    end

end
