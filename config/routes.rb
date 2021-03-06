Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#  get '/operatings', to: 'operatings#show'
#  get '/operatings/edit', to: 'operatings#edit'
#  post '/operatings', to: 'operatings#create'

  resources :operatings
  resources :spreadsheets
 # get '/spreadsheet/:id' to: 'spreadsheet'


#  get '/projects', to: 'projects#show'
  resources :projects
  get '/projects/:id/replace', to: 'projects#replace'
  post '/projects/replace_all', to: 'projects#replace_all'

  get '/sample', to: 'operatings#sample'
end
