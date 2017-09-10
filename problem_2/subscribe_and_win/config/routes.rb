Rails.application.routes.draw do
  get 'subscribers/new'

  resources :subscribers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
