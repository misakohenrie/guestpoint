class EmployeesController < ApplicationController
	before_action :require_signin
	before_action :require_admin, except: [:show, :edit, :update]

	def index
		@unit = Unit.find_by!(slug: params[:unit_id]) 
		@employees = @unit.employees.includes(job_types: :jobs).employee_order
		
	end

	def show
		if current_employee_admin?
			@employee = Employee.includes(job_types: :jobs).find_by!(slug: params[:id])
		else
			require_correct_employee
		end
		@unit = @employee.unit
	end

	def edit
		@employee = Employee.find_by!(slug: params[:id])
		@unit = @employee.unit
	end

	def update
		@employee = Employee.find_by!(slug: params[:id])
		@unit = @employee.unit 
		if @employee.update(employee_params)
			redirect_to employee_path(@employee), notice: "Employee successfully updated!"
		else
			render :edit
		end
	end

	def new
		@unit = Unit.find_by!(slug: params[:unit_id]) 
		@employee = @unit.employees.new
	end

	def create
		@unit = Unit.find_by!(slug: params[:unit_id]) 
		@employee = @unit.employees.new(employee_params)
		if @employee.save
			redirect_to employee_path(@employee), notice: "Employee successfully created!"
		else
			render :new
		end
	end

	def destroy
		@employee = Employee.find_by!(slug: params[:id])
		@employee.destroy
		redirect_to unit_employees_path(current_employee.unit), alert: "Employee successfully deleted!"
	end


private

	def employee_params
		params.require(:employee).permit(:first_name, :middle_name, :last_name, :address1, :address2, :city, :state, :zip, :pin, :ssn, :birthdate, :hire_date, :termination_date, :phone1, :phone2, :picture, :email, :password, :password_confirmation, :job_attributes => [:job_id, :description, :start_date, :end_date])
	end

	def require_correct_employee
		@employee = Employee.includes(job_types: :jobs).find_by!(slug: params[:id])
		unless current_employee?(@employee)
			redirect_to signin_path, alert: "Unauthorized access!"
		end
	end

end

