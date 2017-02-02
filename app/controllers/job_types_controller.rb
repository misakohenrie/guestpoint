class JobTypesController < ApplicationController
	
	

	def index
		@unit = Unit.find_by!(slug: params[:unit_id])
		@job_types = @unit.job_types.job_type_order
	end

	def show
		@job_type = JobType.find_by!(slug: params[:id])
		@employees = @job_type.employees
		@unit = @job_type.unit
	end

	def edit
		@job_type = JobType.find_by!(slug: params[:id])
		@unit = @job_type.unit
	end

	def update
		@job_type = JobType.find_by!(slug: params[:id])
		if @job_type.update(job_type_params)
			redirect_to unit_job_types_path(@unit), notice: "Job Type successfully updated!"
		else
			render :edit
		end
	end

	def new
		@unit = Unit.find_by!(slug: params[:unit_id])
		@job_type = @unit.job_types.new
	end

	def create
		@unit = Unit.find_by!(slug: params[:unit_id])
		@job_type = @unit.job_types.new(job_type_params)

		if @job_type.save
			redirect_to unit_job_types_path(@unit), notice: "Job Type successfully created!"
		else
			render :new
		end
	end

	def destroy
		@job_type = JobType.find_by!(slug: params[:id])
		@job_type.destroy

		redirect_to unit_job_types_path(@unit), alert: "Job Type successfully deleted!"
	end

	private

	def job_type_params
		params.require(:job_type).permit(:description, :tipped)
	end

end
