require 'rails_helper'

describe "Creating a job type" do 
	it "saves and displays it on the job type listing page" do

		visit job_types_url

		click_link 'Add New Job Type'

		expect(current_path).to eq(new_job_type_path)

		fill_in 'Description', with: "Cook"

		click_button 'Create Job type'

		expect(current_path).to eq(job_types_path)

		expect(page).to have_text("Cook")
	end

	it "does not create if it's invalid" do

		visit new_job_type_url

		fill_in 'Description', with: " "

		click_button 'Create Job type'

		expect(page).to have_text('error')
	end


end