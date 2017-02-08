Rails.application.routes.draw do
  	root "units#index"

  	get "signin" => "sessions#new"

	resources :units, shallow: true do
		resources :employees 
		resources :job_types

	end

	resources :employees, shallow: true do
			resources :jobs
	end

	resource :session

end
