Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/operating', to: 'operatings#show'
  post '/operating', to: 'operatings#create'

  get '/sample', to: 'operatings#sample'
end
