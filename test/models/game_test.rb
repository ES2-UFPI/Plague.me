require "test_helper"

class GameTest < ActiveSupport::TestCase

  test "should not save game without a publisher" do
    game = Game.new(
      name_game: 'Example Game',
      description_game: 'This is an example game.',
      release: Date.today,
      rate_game: 4.5,
      franchise: 'Example Franchise',
      developer_id: 1,
      genre_ids: [1, 2],
      platform_ids: [1, 3]
    )
    assert_not game.save, "Saved the game without a publisher"
  end
  
end
