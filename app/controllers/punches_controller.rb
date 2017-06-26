class PunchesController < ApplicationController

	def index
		@employee = Employee.find_by(slug: params[:employee_id])
		@jobs = @employee.jobs.includes(:punches)

	end

	def edit
		@punch = Punch.find(params[:id])
		@job = @punch.job
		@employee = @job.employee
	end

	def update
		@punch = Punch.find(params[:id])
		@job = @punch.job
		@employee = @job.employee
		@unit = @employee.unit
		if current_employee_admin?
			if @punch.update!(punch_params)
				redirect_to employee_punches_path(@employee)
			else
				render :edit
			end
		else
			
			if @punch.update(punch_out: Time.now)
				redirect_to new_unit_timeclock_path(@unit)
			else
				render :edit
			end
		end
	end

	def new
		@employee = Employee.find_by(slug: params[:employee_id])
		@punch = Punch.new
		
	end

	def create
		@employee = Employee.find_by(slug: params[:employee_id])
		@punch = Punch.new(punch_params)
		@unit = @employee.unit
		@punch.punch_in = Time.now
		
		if @punch.save

			redirect_to new_unit_timeclock_path(@unit), notice: "Thank you for clocking in!"
		else
			render :new
		end
	end

	def destroy
		@punch = Punch.find(params[:id])
		@job = @punch.job
		@employee = @job.employee
		@punch.destroy

		redirect_to employee_punches_path(@employee), alert: "Punch successfully deleted!"
	end

private

	def punch_params
		params.require(:punch).permit(:created_at, :punch_out, :job_id, :punch_in)
	end
end