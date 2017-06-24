Rails.application.routes.draw do
  	root "units#index"



  	get "signin" => "sessions#new"
  	



	resources :units, shallow: true do
		resources :employees 
		resources :job_types
		resource :timeclock

	end


	

	resources :employees, shallow: true do
			resources :jobs
			resources :punches, path: :timeclock
	end

	resource :session

	resources :jobs, shallow: true do
		
	end

end
