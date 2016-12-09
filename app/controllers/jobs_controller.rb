class JobsController < ApplicationController
	before_action :set_employee

	def index
		@jobs = @employee.jobs.job_order
	end

	def edit
		@job = @employee.jobs.find(params[:id])
	end

	def update
		@job = @employee.jobs.find(params[:id])

		if @job.update(job_params)
			redirect_to employee_jobs_path(@employee), notice: "Job successfully updated!"
		else
			render :edit
		end
	end

	def new
		@job = @employee.jobs.new
	end

	def create
		@job = @employee.jobs.new(job_params)

		if @job.save
			redirect_to employee_jobs_path(@employee), notice: "Job successfully created!"
		else
			render :new
		end
	end

	def destroy
		@job = @employee.jobs.find(params[:id])

		@job.destroy

		redirect_to employee_jobs_path(@employee), alert: "Job successfully deleted!"
	end
end

private

def set_employee
	@employee = Employee.find(params[:employee_id])
end

def job_params
	params.require(:job).permit(:start_date, :end_date, :job_type_id, :employee_id)
end

