require "test_helper"

class GameTest < ActiveSupport::TestCase

  #Teste para cadastro de jogo com todos os atributos preenchidos corretamente
  test "should save game with all attributes" do
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 2]
    )
    assert game.save, "Could not save the game with all attributes"
  end

  #Teste para cadastro de um jogo com o nome inválido
  test "should not save game with invalid name" do
    game = Game.new(
      name_game: "   ",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 2]
    )
    assert game.save, "Saved the game with an invalid name"
  end

  #Teste para cadastro de um jogo com descrição inválida
  test "should not save game with invalid description" do
    game = Game.new(
      name_game: "Game1",
      description_game: "   ",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 2]
    )
    assert game.save, "Saved the game with an invalid description"
  end

  #Teste para cadsatro de um jogo com data de lançamento inválida
  test "should not save game with invalid release date" do
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: "invalid",
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 2]
    )
    assert game.save, "Saved the game with an invalid invalid release date"
  end

  #Teste para cdastro de um jogo com avaliação inválida
  test "should save game with inavalid rate" do
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: "4 stars",
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 2]
    )
    assert game.save, "Could not save the game with an invalid rate"
  end

  #Teste para cadastro de um jogo com franquia inválida
  test "should not save game with invalid franchise" do
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: 1234,
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 2]
    )
    assert game.save, "Saved the game with an invalid franchise"
  end

  #Teste para cadastro de um jogo com publisher inválido
  test "should not save game with invalid publisher" do
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: "abcd",
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 2]
    )
    assert game.save, "Saved the game with an invalid publisher"
  end

  #Teste para cadastro de jogo com desenvolvedor inválido
  test "should not save game with invalid developer id" do
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: "efgh",
      genre_ids: [1, 2],
      platform_ids: [1, 2]
    )
    assert game.save, "Saved the game with an invalid developer id"
  end

  #Teste para cadastro de jogo com gênero inválido
  test "should not save game with invalid genre id" do
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: "terror",
      platform_ids: [1, 2]
    )
    assert game.save, "Saved the game with an invalid genre id"
  end

  #Teste para cadastro de jogo com plataforma inválida
  test "should not save game with invalid platform id" do
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: "Xbox"
    )
    assert game.save, "Saved the game with an invalid platform id"
  end

end
