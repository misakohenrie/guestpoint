require 'rails_helper'

describe "Editing a job type" do 

	it "updates and displays the new information" do
		job_type = JobType.create(job_type_attributes)

		visit job_types_url

		click_link 'Edit'

		expect(current_path).to eq(edit_job_type_path(job_type))

		expect(find_field('Description').value).to eq(job_type.description)
	
		fill_in 'Description', with: "Updated description"

		click_button 'Update Job type'

		expect(current_path).to eq(job_types_path)

		expect(page).to have_text('Updated description')
		expect(page).to have_text('Job Type successfully updated!')
	end

	it "does not update if it's invalid" do
		job_type = JobType.create(job_type_attributes)

		visit edit_job_type_url(job_type)

		fill_in 'Description', with: " "

		click_button 'Update Job type'

		expect(page).to have_text('error')
	end
end