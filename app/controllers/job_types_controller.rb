class JobTypesController < ApplicationController

	def index
		@job_types = JobType.job_type_order
	end

	def show
		@job_type = JobType.find(params[:id])
		@employees = @job_type.employees
	end

	def edit
		@job_type = JobType.find(params[:id])
	end

	def update
		@job_type = JobType.find(params[:id])

		if @job_type.update(job_type_params)
			redirect_to job_types_path, notice: "Job Type successfully updated!"
		else
			render :edit
		end
	end

	def new
		@job_type = JobType.new
	end

	def create
		@job_type = JobType.new(job_type_params)

		if @job_type.save
			redirect_to job_types_path, notice: "Job Type successfully created!"
		else
			render :new
		end
	end

	def destroy
		@job_type = JobType.find(params[:id])

		@job_type.destroy

		redirect_to job_types_path, alert: "Job Type successfully deleted!"
	end

	private

	def job_type_params
		params.require(:job_type).permit(:description, :tipped)
	end
end
