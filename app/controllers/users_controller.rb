class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: 'Description atualizada com sucesso.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :description)
  end

end
