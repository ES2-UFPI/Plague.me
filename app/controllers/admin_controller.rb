class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @games = Game.all
    @platforms = Platform.all
    @developers = Developer.all
    @publishers = Publisher.all
    @genres = Genre.all
  end

  def check_admin
    redirect_to root_path, alert: "Acesso negado!" unless current_user.is_admin?
  end
  
end
