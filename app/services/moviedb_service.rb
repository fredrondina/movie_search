class MoviedbService
 def search(search_title)
   resp = Faraday.get('https://api.themoviedb.org/3/search/movie') do |req|
     req.params['api_key'] = ENV['movie_db_key']
     req.params['language'] = 'en-US'
     req.params['include_adult'] = false
     req.params['query'] = search_title
   end
   results = JSON.parse(resp.body, symbolize_names: true)
 end

 def load_movie(movie_id)
   resp = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}") do |req|
     req.params['api_key'] = ENV['movie_db_key']
     req.params['language'] = 'en-US'
     req.params['append_to_response'] = 'credits'
   end
   result = JSON.parse(resp.body, symbolize_names: true)
   result[:director] = set_director(result[:credits][:crew])
   return result
 end

 def set_director(cast)
  cast.each do |member|
    return member[:name] if member[:known_for_department] == "Directing"
  end
 end
end
