Rails.application.routes.draw do
  get 'pages/todo' => 'pages#todo'
  resources :tasks, only: %i{index create}, defaults: { format: 'json' }

  root 'pages#todo'
end
