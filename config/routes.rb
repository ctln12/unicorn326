Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: 'students/sessions'}
  devise_for :tutors, paths: 'tutors', controllers: { sessions: 'tutors/sessions' }

  get 'taught_lessons', to: 'taught_lessons#index'
  get 'taught_lessons/new', to: 'taught_lessons#new'
  post 'taught_lessons', to: 'taught_lessons#create'

  root to: 'pages#home'
  resources :subjects, :only => [:index]
  resources :languages, :only => [:index]
  resources :tutors, :only => [:show]
  resources :students, :only => [:show]
  resources :spoken_languages, :only => [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
