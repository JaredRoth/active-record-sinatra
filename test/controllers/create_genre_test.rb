require './test/test_helper'

class CreateGenreTest < Minitest::Test
  include Rack::Test::Methods     # allows us to use get, post, last_request, etc.

  def app     # def app is something that Rack::Test is looking for
    FilmFile
  end

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def test_create_genre_with_valid_attributes
    assert_equal 0, Genre.count

    post '/genres', {genre: {name: 'Cartoon'}}
    assert_equal 201, last_response.status
    follow_redirect!

    assert_equal 1, Genre.count
    # assert_equal 'Cartoon', Genre.last.name
    assert_equal "Genre Created", last_response.body
  end

  def test_cannot_create_genre_without_valid_attributes
    assert_equal 0, Genre.count

    post '/genres', {genre: {}}
    follow_redirect!
    assert_equal 0, Genre.count
    assert_equal 400, last_response.status
    assert_equal "Missing Name", last_response.body
  end
end
