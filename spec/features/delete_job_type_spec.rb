require 'rails_helper'

describe "Deleting a job type" do 

	before do
		@unit = Unit.create!(unit_attributes)
  		@admin = @unit.employees.create!(employee_attributes(admin: true))
  		sign_in(@admin)
	end

	it "destroys the job type and removes it from the list" do

		job_type = @unit.job_types.create(job_type_attributes)
		
		visit unit_job_types_url(@unit)

		click_link 'Delete'

		expect(page).not_to have_text(job_type.description)
		expect(page).to have_text("Job Type successfully deleted!")

	end
end