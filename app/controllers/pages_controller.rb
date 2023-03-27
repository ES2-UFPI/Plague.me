class PagesController < ApplicationController

  def home
    if current_user
      @recommended_games = current_user.recommended_games
    end
  end

end
