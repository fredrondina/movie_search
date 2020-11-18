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
    @director = nil
  end

  def self.search(search_title)
    results = MoviedbService.new.search(search_title)
    @movies = results[:results].map do |result|
      Movie.new(result)
    end
  end

  def self.get_by_id(movie_id)
    resp = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}") do |req|
      req.params['api_key'] = ENV['movie_db_key']
      req.params['language'] = 'en-US'
      req.params['append_to_response'] = 'credits'
    end
    result = JSON.parse(resp.body, symbolize_names: true)
    Movie.new(result)
  end
end
