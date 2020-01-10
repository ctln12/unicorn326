Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: 'students/sessions'}
  devise_for :tutors, paths: 'tutors', controllers: { sessions: 'tutors/sessions' }

  root to: 'pages#home'
  get 'subjects/index', to: 'subjects#index'
  get 'languages/index', to: 'languages#index'
  resources :tutors, :only => [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
