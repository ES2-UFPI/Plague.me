require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "should not save game without name" do
    game = Game.new
    assert_not game.save, "Saved the game without a name"
  end

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
end
