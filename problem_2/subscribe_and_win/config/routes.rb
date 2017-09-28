Rails.application.routes.draw do
  # devise_for :users

  root 'subscribers#new'

  get 'admin/dashbord'

  resources :subscribers, only: %i[new create] do
    member do
      get :check_prize
    end
  end
  resources :prizes
  resources :conditions
end
