class GameMidiaController < ApplicationController
  before_action :set_game_midium, only: %i[ show edit update destroy ]

  # GET /game_midia or /game_midia.json
  def index
    @game_midia = GameMidium.all
  end

  # GET /game_midia/1 or /game_midia/1.json
  def show
  end

  # GET /game_midia/new
  def new
    @game_midium = GameMidium.new
  end

  # GET /game_midia/1/edit
  def edit
  end

  # POST /game_midia or /game_midia.json
  def create
    @game_midium = GameMidium.new(game_midium_params)

    respond_to do |format|
      if @game_midium.save
        format.html { redirect_to game_midium_url(@game_midium), notice: "Game midium was successfully created." }
        format.json { render :show, status: :created, location: @game_midium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_midium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_midia/1 or /game_midia/1.json
  def update
    respond_to do |format|
      if @game_midium.update(game_midium_params)
        format.html { redirect_to game_midium_url(@game_midium), notice: "Game midium was successfully updated." }
        format.json { render :show, status: :ok, location: @game_midium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_midium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_midia/1 or /game_midia/1.json
  def destroy
    @game_midium.destroy

    respond_to do |format|
      format.html { redirect_to game_midia_url, notice: "Game midium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_midium
      @game_midium = GameMidium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_midium_params
      params.require(:game_midium).permit(:screenshotGameMidia, :videoGameMidia)
    end
end
