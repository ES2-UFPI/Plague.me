require "test_helper"

class GameMidiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_midium = game_midia(:one)
  end

  test "should get index" do
    get game_midia_url
    assert_response :success
  end

  test "should get new" do
    get new_game_midium_url
    assert_response :success
  end

  test "should create game_midium" do
    assert_difference("GameMidium.count") do
      post game_midia_url, params: { game_midium: { screenshotGameMidia: @game_midium.screenshotGameMidia, videoGameMidia: @game_midium.videoGameMidia } }
    end

    assert_redirected_to game_midium_url(GameMidium.last)
  end

  test "should show game_midium" do
    get game_midium_url(@game_midium)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_midium_url(@game_midium)
    assert_response :success
  end

  test "should update game_midium" do
    patch game_midium_url(@game_midium), params: { game_midium: { screenshotGameMidia: @game_midium.screenshotGameMidia, videoGameMidia: @game_midium.videoGameMidia } }
    assert_redirected_to game_midium_url(@game_midium)
  end

  test "should destroy game_midium" do
    assert_difference("GameMidium.count", -1) do
      delete game_midium_url(@game_midium)
    end

    assert_redirected_to game_midia_url
  end
end
