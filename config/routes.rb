Rails.application.routes.draw do
  resources :tasks
  resources :projects

  get 'tasks/:task_id/start', to: 'tasks#start'
  get 'tasks/:task_id/stop', to: 'tasks#stop'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
