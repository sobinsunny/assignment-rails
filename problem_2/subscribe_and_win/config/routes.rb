Rails.application.routes.draw do

	  # devise_for :users

	root 'subscribers#new'

	get 'admin/dashbord'

	resources :subscribers, only: [:new,:create] do
		member do 
			get :check_prize
		end
	end
	resources :prizes
	resources :conditions, only: [:new,:create,:index]

end
