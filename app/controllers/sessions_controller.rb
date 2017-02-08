class SessionsController < ApplicationController

	def new
		
	end

	def create
		if employee = Employee.authenticate(params[:email], params[:password])
			session[:employee_id] = employee.id
			flash[:notice] = "Welcome back #{employee.first_name}!"
			unit = employee.unit

			if current_employee_admin?
				redirect_to(session[:intended_url] || unit_employees_path(unit))
			else
				redirect_to(session[:intended_url] || employee_path(employee))
			end

			session[:intended_url] = nil
		else
			flash.now[:alert] = "Invalid email/password combination"
			render :new
		end
	end

	def destroy
		session[:employee_id] = nil
		redirect_to root_url, notice: "You are now signed out!"
	end
end