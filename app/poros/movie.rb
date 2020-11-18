class Movie
    attr_reader :id,
                :title,
                :release_date,
                :poster_url,
                :overview,
                :director

  def initialize(movie)
    @id = movie[:id]
    @title = movie[:title]
    @release_date = movie[:release_date]
    @poster_url = movie[:poster_path]
    @backdrop_url = movie[:backdrop_path]
    @overview = movie[:overview]
    @director = movie[:director]
  end

  def self.search(search_title)
    results = MoviedbService.new.search(search_title)
    movies = results[:results].map do |result|
      Movie.new(result)
    end
  end

  def self.get_by_id(movie_id)
    shown_movie = Movie.new(MoviedbService.new.load_movie(movie_id))
  end
end
