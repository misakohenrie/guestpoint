require 'rails_helper'

describe "Deleting a job" do 

	it "destroys the job and removes it from the list" do
		unit = Unit.create!(unit_attributes)
		employee = unit.employees.create(employee_attributes)
		job_type = unit.job_types.create(job_type_attributes)
		job = employee.jobs.create(job_attributes(job_type: job_type, start_date:"2010-12-12"))
		
		visit employee_jobs_url(employee)
		
		click_link 'Delete'

		expect(current_path).to eq(employee_jobs_path(employee))

		expect(page).not_to have_text("2010")

	end

end