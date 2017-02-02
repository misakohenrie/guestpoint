require 'rails_helper'

describe "Deleting a job type" do 

	it "destroys the job type and removes it from the list" do
		unit = Unit.create!(unit_attributes)

		job_type = unit.job_types.create(job_type_attributes)
		
		visit unit_job_types_url(unit)

		click_link 'Delete'

		expect(page).not_to have_text(job_type.description)
		expect(page).to have_text("Job Type successfully deleted!")

	end
end