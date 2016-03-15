Rails.application.routes.draw do
  root to: 'search#index'

  post '/search/:page', :to => 'search#search'

end
