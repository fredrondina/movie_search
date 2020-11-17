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
    resp = Faraday.get('https://api.themoviedb.org/3/search/movie') do |req|
      req.params['api_key'] = ENV['movie_db_key']
      req.params['language'] = 'en-US'
      req.params['include_adult'] = false
      req.params['query'] = search_title
    end

    results = JSON.parse(resp.body, symbolize_names: true)
      @movies = results[:results].map do |result|
      Movie.new(result)
    end
  end
end
