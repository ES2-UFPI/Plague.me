require "test_helper"

class GenreTest < ActiveSupport::TestCase

  #Teste para cadastro de genre com todos os atributos
  test "should save genre with all attributes" do
    genre = Genre.new(
      name_genre: "Genre1", 
      description_genre: "Description genre"
    )
    assert genre.save, "Could not save the genre with all atributes"
  end

  #Teste para cadastro de genre com nome inválido
  test "should save genre with an invalid name" do
    genre = Genre.new(
      name_genre: "   ", 
      description_genre: "Description genre"
    )
    refute genre.save, "Saved the genre with an invalid name"
  end

  #Teste para cadastro de genre com descrição inválido
  test "should save genre with an invalid description" do
    genre = Genre.new(
      name_genre: "Genre1", 
      description_genre: "   "
    )
    refute genre.save, "Saved the genre with an invalid description"
  end

end
