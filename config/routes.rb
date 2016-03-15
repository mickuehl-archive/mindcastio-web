Rails.application.routes.draw do

  root to: 'search#index'

  post '/search/:page', :to => 'search#search'

  get '/p/:uid', :to => 'podcast#podcast'
  get '/e/:uid', :to => 'podcast#episode'

end
