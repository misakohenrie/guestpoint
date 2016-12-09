Rails.application.routes.draw do
  
  	
 
	root "employees#index"
	resources :employees do
		resources :jobs
	end
	resources :job_types
		
	
end
