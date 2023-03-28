class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[favorite wishlist]

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
    @average_rating = @game.rate_game
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

  def favorite
    @game = Game.find(params[:id])
    if current_user.favorite_games.include?(@game)
      current_user.favorite_games.delete(@game)
      flash[:notice] = "Game removed from favorites."
    else
      current_user.favorite_games << @game
      flash[:notice] = "Game added to favorites."
    end
    redirect_to @game
  end

  def wishlist
    @game = Game.find(params[:id])
    if current_user.wishlist_games.include?(@game)
      current_user.wishlist_games.delete(@game)
      flash[:notice] = "Game removed from wishlist."
    else
      current_user.wishlist_games << @game
      flash[:notice] = "Game added to wishlist."
    end
    redirect_to @game
  end

  def add_to_collection
    @game = Game.find(params[:id])
    @collection = current_user.collections.find(params[:collection_item][:collection_id])
    if @collection.collection_items.exists?(game_id: @game.id)
      redirect_to @game, alert: 'Este jogo já está na coleção.'
    else
      @collection_item = CollectionItem.new(collection: @collection, game: @game)
      if @collection_item.save
        redirect_to @game, notice: 'Jogo adicionado à coleção.'
      else
        redirect_to @game, alert: 'Falha ao adicionar jogo à coleção.'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name_game, :description_game, :release, :rate_game, :franchise, :publisher_id, :developer_id, :icon, genre_ids: [], platform_ids: [])
    end

end
