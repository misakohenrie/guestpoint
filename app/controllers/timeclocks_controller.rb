class TimeclocksController < ApplicationController

	def new
		@unit = Unit.find_by!(slug: params[:unit_id])
	end

	def create
		@unit = Unit.find_by!(slug: params[:unit_id])

		if @employee = Employee.find_by_pin(params[:pin])
			if @employee.punches.last.nil?
				redirect_to new_employee_punch_path(@employee)
			else
				if clocked_in?(@employee)
					@punch = @employee.punches.last
					redirect_to edit_punch_path(@punch)
				else
					redirect_to new_employee_punch_path(@employee)
				end
			end
		else
			render :new
		end
		
	end
end