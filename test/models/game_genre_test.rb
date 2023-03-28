require "test_helper"

class GameGenreTest < ActiveSupport::TestCase
  
  #Teste para verificar se um game_genre é salvo sem um game ou genre
  test "should not save game_genre without game or genre" do
    game_genre = GameGenre.new
    refute game_genre.save, "Saved the game_genre without game or genre"
  end

  #Teste para verificar se um game_genre é salvo com game e genre
  test "should save game_genre with game and genre" do
    game = Game.create(
      name_game: "Game1", 
      description_game: "Description1", 
      release: 2022-01-01, 
      rate_game: 4, 
      franchise: "Franchise1", 
      publisher_id: 1, 
      developer_id: 1)
    genre = Genre.create(
      name_genre: "genre1", 
      description_genre: "Description1")
    game_genre = GameGenre.new(
      game_id: game.id, 
      genre_id: genre.id)
    refute game_genre.save, "Could not save the game_genre with game and genre"
  end

  #Teste para saber se uma plataforma está associada a um game 
  test "should associate genre to a game" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    game = Game.create(
    name_game: "Game1",
    description_game: "Description1",
    release: 2022-01-01,
    rate_game: 4,
    franchise: "Franchise1",
    publisher_id: 1,
    developer_id: 1,
    genre_ids: [],
    platform_ids: [platform1.id]
    )
    assert game.genres << genre1, "Could not associate genre to game"
  end

end
