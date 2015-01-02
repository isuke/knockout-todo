Rails.application.routes.draw do
  get 'pages/todo' => 'pages#todo'
  resources :tasks, only: %i{index}, default: :json

  root 'pages#todo'
end
