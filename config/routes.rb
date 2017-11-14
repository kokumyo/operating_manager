Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#  get '/operatings', to: 'operatings#show'
#  get '/operatings/edit', to: 'operatings#edit'
#  post '/operatings', to: 'operatings#create'

  resources :operatings
  resources :spreadsheets
 # get '/spreadsheet/:id' to: 'spreadsheet'


  get '/sample', to: 'operatings#sample'
end
