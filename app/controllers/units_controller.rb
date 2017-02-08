class UnitsController < ApplicationController

	
	def index
		@units = Unit.all
	end

	def show
		@unit = Unit.find_by!(slug: params[:id])
	end

	def edit
		@unit = Unit.find_by!(slug: params[:id])
	end

	def update
		@unit = Unit.find_by!(slug: params[:id])
		if @unit.update(unit_params)
			redirect_to @unit, notice: "Unit successfully updated!"
		else
			render :edit
		end
	end

	def new
		@unit = Unit.new
	end

	def create
		@unit = Unit.new(unit_params)
		if @unit.save
			redirect_to @unit, notice: "Unit successfully created!"
		else
			render :new
		end

	end

	def destroy
		@unit = Unit.find_by!(slug: params[:id])
		@unit.destroy
		redirect_to units_path, alert: "Unit successfully deleted!"
	end
end

private

	def unit_params
		params.require(:unit).permit(:name, :phone, :address, :city, :state, :zip)
	end
