class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private

  	def require_signin
  		unless current_employee
  			session[:intended_url] = request.url
  			redirect_to signin_url, alert: "Please sign in first!"
  		end
 	end

 	def require_admin
 		unless current_employee_admin?
 			redirect_to signin_url, alert: "Unauthorized access!"
 		end
 	end

 	def current_employee_admin?
 		current_employee && current_employee.admin?
 	end

  	def current_employee
		@current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
	end

	def current_employee?(employee)
		current_employee == employee
	end


	def clocked_in?(employee)
		employee.punches.last == Punch.active_punch
	end


	helper_method :current_employee
	helper_method :current_employee?
	helper_method :current_employee_admin?
	helper_method :clocked_in?


end
