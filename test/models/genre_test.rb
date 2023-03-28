require "test_helper"

class GenreTest < ActiveSupport::TestCase

  test "should not save genre without name_genre" do
    genre = Genre.new(description_genre: 'Test description')
    assert_not genre.save, "Saved the genre without a name_genre"
  end
    
end
