require 'rails_helper'

describe "Deleting a job type" do 

	it "destroys the job type and removes it from the list" do

		job_type = JobType.create(job_type_attributes)
		
		visit job_types_url

		click_link 'Delete'

		expect(page).not_to have_text(job_type.description)
		expect(page).to have_text("Job Type successfully deleted!")

	end
end