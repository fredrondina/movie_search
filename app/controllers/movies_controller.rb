class MoviesController < ApplicationController
  def index
    @movies = Movie.search(params["search_title"])
  end

  def show
    @movie = Movie.get_by_id(params[:movie_id])
  end
end
