Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: 'students/sessions'}
  devise_for :tutors, paths: 'tutors', controllers: { registrations: 'tutors/registrations', sessions: 'tutors/sessions' }

  root to: 'pages#home'
  
  resources :students, only: [:show]
  
  resources :tutors, only: [:index, :show] do
    collection do
      get 'profile'
    end
  end
  
  resources :job_posts do
    resources :comments,only: [:new, :create, :edit, :update, :destroy]
  end
  
  resources :subjects, only: [:index]
  resources :languages, only: [:index]
  
  resources :taught_lessons, only: [:index, :new, :create, :destroy]
  resources :spoken_languages, only: [:index, :new, :create, :destroy]
  
  resources :bookings, only: [:index, :new, :create, :show, :edit, :update] do
    resources :payments, only: :new
    resources :reviews, only: [:new, :create, :edit, :update, :show]
  end
  
  resources :wallets, only: [:show]  
  
  put '/stripe', to: 'bookings#stripe', as: 'stripe'

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
