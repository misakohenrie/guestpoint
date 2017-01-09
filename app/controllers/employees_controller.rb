class EmployeesController < ApplicationController
	def index
		@employees = Employee.employee_order
	end

	def show
		@employee = Employee.find(params[:id])
		@jobs = @employee.jobs.job_order
		
	end

	def edit
		@employee = Employee.find(params[:id])
		@jobs = @employee.jobs.job_order
		
	end

	def update
		@employee = Employee.find(params[:id])
		if @employee.update(employee_params)
			redirect_to @employee, notice: "Employee successfully updated!"
		else
			render :edit
		end
	end

	def new
		@employee = Employee.new
		1.times do
			@jobs = @employee.jobs.build
		end
	end

	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			redirect_to @employee, notice: "Employee successfully created!"
		else
			render :new
		end
	end

	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to employees_path, alert: "Employee successfully deleted!"
	end
end

private

def employee_params
		params.require(:employee).permit(:first_name, :middle_name, :last_name, :address1, :address2, :city, :state, :zip, :pin, :ssn, :birthdate, :hire_date, :termination_date, :phone1, :phone2, :picture, :job_attributes => [:job_id, :description, :start_date, :end_date])
end