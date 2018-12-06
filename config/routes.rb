Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  get 'colocs/new', to:'colocs#new'
  post 'colocs', to:'colocs#create'
  get 'tasks/select', to:'tasks#select_tasks'
  post 'tasks/select', to:'tasks#save_selection'
  # get 'plannings', to:'plannings#index'
  # patch 'plannings/:id', to:'plannings#update', as: 'planning'
  resources :plannings, only: [:index, :update]
end
