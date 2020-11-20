Rails.application.routes.draw do

  get '/', to: 'search#index'

  get '/movies', to: 'movies#index'
  get '/movies/:movie_id', to: 'movies#show'

  post '/rating/:rating_id/:up_or_down', to: 'rating#update'

end
