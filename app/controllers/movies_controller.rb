class MoviesController < ApplicationController
  def index
    resp = Faraday.get('https://api.themoviedb.org/3/search/movie') do |req|
      req.params['api_key'] = ENV['movie_db_key']
      req.params['language'] = 'en-US'
      req.params['include_adult'] = false
      req.params['query'] = params["search_title"]
    end
    results = JSON.parse(resp.body, symbolize_names: true)
    binding.pry
  end
end
