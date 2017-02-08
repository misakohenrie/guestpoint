require 'rails_helper'

describe "Creating a job type" do 

	before do
		@unit = Unit.create!(unit_attributes)
  		@admin = @unit.employees.create!(employee_attributes(admin: true))
  		sign_in(@admin)
	end

	it "saves and displays it on the job type listing page" do

		visit unit_job_types_url(@unit)

		click_link 'Add New Job Type'

		expect(current_path).to eq(new_unit_job_type_path(@unit))

		fill_in 'Description', with: "Cook"

		click_button 'Create Job type'

		expect(current_path).to eq(unit_job_types_path(@unit))

		expect(page).to have_text("Cook")
	end

	it "does not create if it's invalid" do
		
		visit new_unit_job_type_url(@unit)

		fill_in 'Description', with: " "

		click_button 'Create Job type'

		expect(page).to have_text('error')
	end


end