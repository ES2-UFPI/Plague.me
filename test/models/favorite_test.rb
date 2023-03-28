require "test_helper"

class FavoriteTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(
      email: "alice@example.com",
      password: "secret", 
      password_confirmation: "secret",
      nickname: "Alice", 
      description: "User description")
    @publisher = Publisher.create(name_publisher: "Publisher1", description_publisher: "Publisher1")
    @developer = Developer.create(name_developer: "Developer1", description_developer: "Developer1")
    @game = Game.create(
      name_game: "Game1", 
      description_game: "Description1", 
      release: Date.new(2022, 01, 01), 
      rate_game: 4, 
      franchise: "Franchise1", 
      publisher: @publisher, 
      developer: @developer)
    @genre = Genre.create(
      name_genre: "Genre1", 
      description_genre: "Genre1")
    @platform = Platform.create(
      name_platform: "Platform1", 
      description_platform: "Platform1")
    @game.genres << @genre
    @game.platforms << @platform
    @favorite = Favorite.new(user: @user, game: @game)
  end
  
  #Teste para verificar se um jogo está sendo adicionado aos favoritos
  test "should be able to create a favorite" do
    assert @favorite.save
  end
  
  #Teste para verificar se um jogo está sendo removido dos favoritos
  test "should be able to remove a favorite" do
    @favorite.save
    assert_difference('Favorite.count', -1) do
      @favorite.destroy
    end
  end
  
  # Teste para verificar se um jogo está sendo adicionado aos favoritos mais de uma vez
  test "should not be able to add the same game to favorites more than once" do
    @favorite.save
    duplicate_favorite = Favorite.new(user: @user, game: @game)
    assert duplicate_favorite.save, "Should not be able to add the same game to favorites more than once"
  end
  
end
