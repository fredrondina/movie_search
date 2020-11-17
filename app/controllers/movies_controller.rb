class MoviesController < ApplicationController
  def index
    @movies = Movie.search(params["search_title"])
  end
end
