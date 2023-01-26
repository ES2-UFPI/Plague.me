require "application_system_test_case"

class GameMidiaTest < ApplicationSystemTestCase
  setup do
    @game_midium = game_midia(:one)
  end

  test "visiting the index" do
    visit game_midia_url
    assert_selector "h1", text: "Game midia"
  end

  test "should create game midium" do
    visit game_midia_url
    click_on "New game midium"

    fill_in "Screenshotgamemidia", with: @game_midium.screenshotGameMidia
    fill_in "Videogamemidia", with: @game_midium.videoGameMidia
    click_on "Create Game midium"

    assert_text "Game midium was successfully created"
    click_on "Back"
  end

  test "should update Game midium" do
    visit game_midium_url(@game_midium)
    click_on "Edit this game midium", match: :first

    fill_in "Screenshotgamemidia", with: @game_midium.screenshotGameMidia
    fill_in "Videogamemidia", with: @game_midium.videoGameMidia
    click_on "Update Game midium"

    assert_text "Game midium was successfully updated"
    click_on "Back"
  end

  test "should destroy Game midium" do
    visit game_midium_url(@game_midium)
    click_on "Destroy this game midium", match: :first

    assert_text "Game midium was successfully destroyed"
  end
end
