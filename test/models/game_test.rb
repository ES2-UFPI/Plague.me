require "test_helper"

class GameTest < ActiveSupport::TestCase

  #Teste para cadastro de jogo com todos os atributos preenchidos corretamente
  test "should save game with all attributes" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [genre1.id, genre2.id],
      platform_ids: [platform1.id, platform2.id]
    )
    refute game.save, "Could not save the game with all attributes"
  end

  #Teste para cadastro de um jogo com o nome inválido
  test "should not save game with invalid name" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    game = Game.new(
      name_game: "   ",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [genre1.id, genre2.id],
      platform_ids: [platform1.id, platform2.id]
    )
    refute game.save, "Saved the game with an invalid name"
  end

  #Teste para cadastro de um jogo com descrição inválida
  test "should not save game with invalid description" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    game = Game.new(
      name_game: "Game1",
      description_game: "   ",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [genre1.id, genre2.id],
      platform_ids: [platform1.id, platform2.id]
    )
    refute game.save, "Saved the game with an invalid description"
  end

  #Teste para cadsatro de um jogo com data de lançamento inválida
  test "should not save game with invalid release date" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: "invalid",
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [genre1.id, genre2.id],
      platform_ids: [platform1.id, platform2.id]
    )
    refute game.save, "Saved the game with an invalid release date"
  end

  #Teste para cdastro de um jogo com avaliação inválida
  test "should save game with inavalid rate" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: "4 stars",
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [genre1.id, genre2.id],
      platform_ids: [platform1.id, platform2.id]
    )
    refute game.save, "Saved the game with an invalid rate"
  end

  #Teste para cadastro de um jogo com franquia inválida
  test "should not save game with invalid franchise" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: 1234,
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [genre1.id, genre2.id],
      platform_ids: [platform1.id, platform2.id]
    )
    refute game.save, "Saved the game with an invalid franchise"
  end

  #Teste para cadastro de um jogo com publisher inválido
  test "should not save game with invalid publisher" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: "abcd",
      developer_id: 1,
      genre_ids: [genre1.id, genre2.id],
      platform_ids: [platform1.id, platform2.id]
    )
    refute game.save, "Saved the game with an invalid publisher"
  end

  #Teste para cadastro de jogo com desenvolvedor inválido
  test "should not save game with invalid developer id" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: "efgh",
      genre_ids: [genre1.id, genre2.id],
      platform_ids: [platform1.id, platform2.id]
    )
    refute game.save, "Saved the game with an invalid developer id"
  end

  #Teste para cadastro de jogo com gênero inválido
  test "should not save game with invalid genre id" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    Genre.where(id: 999).delete_all # exclui o registro com o id 999
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [genre1.id, 999],
      platform_ids: [platform1.id, platform2.id]
    )
    refute game.save, "Saved the game with an invalid genre id"
  end  

  #Teste para cadastro de jogo com plataforma inválida
  test "should not save game with invalid platform id" do
    genre1 = Genre.create(name_genre: "Genre1", description_genre: "Genre1")
    genre2 = Genre.create(name_genre: "Genre2", description_genre: "Genre2")
    platform1 = Platform.create(name_platform: "Platform1", description_platform: "Platform1")
    platform2 = Platform.create(name_platform: "Platform2", description_platform: "Platform2")
    Platform.where(id: 999).delete_all
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: 2022-01-01,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [genre1.id, genre2.id],
      platform_ids: [platform1.id, 999]
    )
    refute game.save, "Saved the game with an invalid platform id"
  end

end
