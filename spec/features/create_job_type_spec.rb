require 'rails_helper'

describe "Creating a job type" do 
	it "saves and displays it on the job type listing page" do
		unit = Unit.create!(unit_attributes)

		visit unit_job_types_url(unit)

		click_link 'Add New Job Type'

		expect(current_path).to eq(new_unit_job_type_path(unit))

		fill_in 'Description', with: "Cook"

		click_button 'Create Job type'

		expect(current_path).to eq(unit_job_types_path(unit))

		expect(page).to have_text("Cook")
	end

	it "does not create if it's invalid" do
		unit = Unit.create!(unit_attributes)
		
		visit new_unit_job_type_url(unit)

		fill_in 'Description', with: " "

		click_button 'Create Job type'

		expect(page).to have_text('error')
	end


end