require "test_helper"

class GameTest < ActiveSupport::TestCase

  test "should save game with all attributes" do
    game = Game.new(
      name_game: "Game1",
      description_game: "Description1",
      release: Date.today,
      rate_game: 4,
      franchise: "Franchise1",
      publisher_id: 1,
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 2]
    )
    assert game.save, "Could not save the game with all attributes"
  end

  test 'should not save game without a title' do
    game = Game.new
    assert_not game.save, 'Saved the game without a title'
  end

  test "should save game without optional attributes" do
    game = Game.new(
      name_game: "Test Game", 
      release: Date.today, 
      publisher_id: 1, 
      developer_id: 1
    )
    assert game.save
  end

  #test "should not save game without a publisher" do
  #  game = Game.new(
  #   name_game: 'Example Game',
  #    description_game: 'This is an example game.',
  #    release: Date.today,
  #    rate_game: 4.5,
  #    franchise: 'Example Franchise',
  #    developer_id: 1,
  #    genre_ids: [1, 2],
  #    platform_ids: [1, 3]
  #  )
  #  assert_not game.save, "Saved the game without a publisher"
  #end

  test "should not save game without a publisher" do
    publisher = Publisher.create(name: 'Example Publisher')
    game = Game.new(
      name_game: 'Example Game',
      description_game: 'This is an example game.',
      release: Date.today,
      rate_game: 4.5,
      franchise: 'Example Franchise',
      developer_id: 1,
      publisher_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 3]
    )
    assert_not game.save, "Saved the game without a publisher"
  end
end
