require "test_helper"

class GamePlatformTest < ActiveSupport::TestCase

  #Teste para verificar se um game_platform é salvo sem um game ou platform
  test "should not save game_platform without game or platform" do
    game_platform = GamePlatform.new
    refute game_platform.save, "Saved the game_platform without game or platform"
  end

  #Teste para verificar se um game_platform é salvo com game e platform
  test "should save game_platform with game and platform" do
    game = Game.create(
      name_game: "Game1", 
      description_game: "Description1", 
      release: 2022-01-01, 
      rate_game: 4, 
      franchise: "Franchise1", 
      publisher_id: 1, 
      developer_id: 1)
    platform = Platform.create(
      name_platform: "Platform1", 
      description_platform: "Description1")
    game_platform = GamePlatform.new(
      game_id: game.id, 
      platform_id: platform.id)
    refute game_platform.save, "Could not save the game_platform with game and platform"
  end

  #Teste para saber se uma plataforma está associada a um game 
  test "should associate platform to a game" do
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
    genre_ids: [genre1.id],
    platform_ids: []
    )
    assert game.platforms << platform1, "Could not associate platform to game"
  end

end
