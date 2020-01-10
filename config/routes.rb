Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: 'students/sessions'}
  devise_for :tutors, paths: 'tutors', controllers: { sessions: 'tutors/sessions' }

  get 'taught_lessons/', to: 'taught_lessons#index'
  get 'taught_lessons/new', to: 'taught_lessons#new'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
