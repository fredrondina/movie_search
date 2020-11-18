Rails.application.routes.draw do

  get '/', to: 'search#index'

  get '/movies', to: 'movies#index'
  get '/movies/:movie_id', to: 'movies#show'

end
