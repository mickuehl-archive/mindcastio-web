Rails.application.routes.draw do
  root to: 'visitors#index'
  post '/search', :to => 'visitors#search'
end
