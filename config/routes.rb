Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: 'students/sessions'}
  devise_for :tutors, paths: 'tutors', controllers: { sessions: 'tutors/sessions' }

  root to: 'pages#home'
  resources :students, :only => [:show]
  resources :tutors, :only => [:index, :show]
  resources :subjects, :only => [:index]
  resources :languages, :only => [:index]
  resources :taught_lessons, :only => [:index, :new, :create, :destroy]
  resources :spoken_languages, :only => [:index, :new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
