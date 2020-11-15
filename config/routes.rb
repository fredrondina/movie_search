Rails.application.routes.draw do

  get '/', to: 'search#index'

  get '/movies', to: 'movies#index'

end
