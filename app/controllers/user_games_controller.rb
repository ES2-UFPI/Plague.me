class UserGamesController < ApplicationController
  before_action :authenticate_user!

    def index
      @user = User.find(params[:user_id])
      @user_games = @user.user_games
      @played_games = @user_games.played
      @in_progress_games = @user_games.playing
      @unfinished = @user_games.unfinished
    end

    def create
      @game = Game.find(params[:game_id])
      @user_game = current_user.user_games.build(user_game_params)
      @user_game.game = @game
  
      if @user_game.save
        redirect_to @game, notice: "Jogo adicionado à biblioteca."
      else
        render 'games/show'
      end
    end
  
    private
  
    def user_game_params
      params.require(:user_game).permit(:status)
    end
  end
