class FilmFile < Sinatra::Base
  get '/films' do
    @films = Film.all
    erb :films_index
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres_index
  end

  get '/director/:id' do |id|
    @director = Director.find(id)
    erb :show_director
  end
end
