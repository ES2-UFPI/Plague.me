class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: 'Description atualizada com sucesso.'
    else
      render :edit
    end
  end

  def friends
    @user = User.find(params[:id])
    @friends = @user.friends
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :description)
  end

end
