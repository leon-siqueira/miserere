Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :confession_queues do
    resources :schedulings, only: %i[index new create edit update]
  end

  resources :schedulings, only: %i[destroy]

  root to: 'confession_queues#index'
end
