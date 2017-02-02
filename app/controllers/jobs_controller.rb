class JobsController < ApplicationController

	def index
		@employee = Employee.find_by!(slug: params[:employee_id])
		@jobs = @employee.jobs.job_order
		@unit = @employee.unit
	end

	def edit
		@job = Job.find(params[:id])
		@employee = @job.employee
	end

	def update
		@job = Job.find(params[:id])
		if @job.update(job_params)
			redirect_to unit_employee_jobs_path(@unit, @employee), notice: "Job successfully updated!"
		else
			render :edit
		end
	end

	def new
		@employee = Employee.find_by!(slug: params[:employee_id])
		@job = @employee.jobs.new
	end

	def create
		@employee = Employee.find_by!(slug: params[:employee_id])
		@job = @employee.jobs.new(job_params)

		if @job.save
			redirect_to unit_employee_jobs_path(@unit, @employee), notice: "Job successfully created!"
		else
			render :new
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy

		redirect_to unit_employee_jobs_path(@unit,@employee), alert: "Job successfully deleted!"
	end
end


private


def job_params
	params.require(:job).permit(:start_date, :end_date, :job_type_id, :employee_id)
end

