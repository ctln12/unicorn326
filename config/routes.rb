Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :students, path: 'students', controllers: { sessions: 'students/sessions'}
  devise_for :tutors, paths: 'tutors', controllers: { registrations: 'tutors/registrations', sessions: 'tutors/sessions' }

  root to: 'pages#home'

  resources :students, only: [:show]

  resources :tutors, only: [:index, :show] do
    collection do
      get 'profile'
    end
    resources :bookings, only: [:new, :create]
    resources :wallets, only: [:create, :show, :update]
  end

  resources :job_posts do
    resources :comments,only: [:new, :create, :edit, :update, :destroy]
  end

  resources :subjects, only: [:index]
  resources :languages, only: [:index]

  resources :taught_lessons, only: [:index, :new, :create, :destroy]
  resources :spoken_languages, only: [:index, :new, :create, :destroy]

  resources :bookings, only: [:index, :show, :edit, :update] do
    collection do
      get '/:id/accept', to: 'bookings#accept'
      get '/:id/pay', to: 'bookings#pay'
      get '/:id/cancel', to: 'bookings#cancel'
    end
    resources :payments, only: :new
    resources :reviews, only: [:new, :create, :edit, :update, :show]
    resources :lessons, only: [:create, :show]
  end

  resources :chats, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end

  put '/stripe', to: 'bookings#stripe', as: 'stripe'

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  require "sidekiq/web"
  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :archives, only: [:index] do
    collection do
      post '/start', to: 'archives#start', as: 'start'
      post '/:id/stop', to: 'archives#stop', as: 'stop'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
