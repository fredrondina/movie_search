class MoviesController < ApplicationController
  def index
    @movies = Movie.search(params["search_title"])
  end

  def show
    @movie = Movie.get_by_id(params[:movie_id])
    @rating = Rating.find_or_create_by(movie_id: @movie.id) do |r|
      r.title = @movie.title
    end
  end
end
