Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: 'students/sessions'}
  devise_for :tutors, paths: 'tutors', controllers: { sessions: 'tutors/sessions' }

  root to: 'pages#home'
  resources :taught_lessons
  resources :subjects, :only => [:index]
  resources :languages, :only => [:index]
  resources :tutors, :only => [:show]
  resources :students, :only => [:show]
  resources :spoken_languages, :only => [:new, :create, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
