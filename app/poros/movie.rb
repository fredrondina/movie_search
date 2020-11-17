class Movie
    attr_reader :id,
                :title,
                :release_date,
                :poster_url,
                :overview

  def initialize(movie)
    @id = movie[:id]
    @title = movie[:title]
    @release_date = movie[:release_date]
    @poster_url = movie[:poster_path]
    @overview = movie[:overview]
  end

  def self.search(search_title)
    results = MoviedbService.new.search(search_title)
    @movies = results[:results].map do |result|
      Movie.new(result)
    end
  end
end
