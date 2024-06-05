Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks, only: [:index, :new, :create, :destroy]
  get 'delete_tasks', to: 'tasks#delete'
  get 'select_task_to_delete', to: 'tasks#select_task_to_delete'
  delete 'delete_selected_task', to: 'tasks#delete_selected_task'
  devise_for :users
end
