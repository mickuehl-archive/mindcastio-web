Rails.application.routes.draw do
  root to: 'visitors#index'

  post '/search/:page', :to => 'visitors#search'
  
end
