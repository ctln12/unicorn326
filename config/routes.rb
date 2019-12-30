Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
