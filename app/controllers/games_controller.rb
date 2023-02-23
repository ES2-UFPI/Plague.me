class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    if params[:query].present?
      @games = Game.where("name_game ILIKE ?", "%#{params[:query]}%")
    else
      @games = Game.all
    end
  end

  def filtered_search
    @genres = Genre.all
    @games = if params[:genre_id].present?
      Genre.find(params[:genre_id]).games
    else
      Game.all
    end
  end

  # GET /games/1 or /games/1.json
  def show
    @games = Game.find(params[:id])
  end

  # GET /games/new
  def new
    @game = Game.new
    @game.genres.build
    @game.platforms.build
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name_game, :description_game, :release, :rate_game, :franchise,:publisher_id, :developer_id, genre_ids: [], platform_ids: [])
    end
end
