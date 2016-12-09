require 'rails_helper'

describe "Editing a job" do 

	it "updates the job and displays the new information" do 
		employee = Employee.create(employee_attributes)
		job_type = JobType.create(job_type_attributes)
		job = employee.jobs.create(job_attributes(job_type: job_type, start_date:"2010-12-12"))
		
		visit employee_jobs_url(employee)

		click_link "Edit"

		expect(current_path).to eq(edit_employee_job_path(employee, job))

		expect(find_field("Start date").value).to eq("2010-12-12")

		fill_in 'Start date', with: "2014-01-11"

		click_button 'Update Job'

		expect(current_path).to eq(employee_jobs_path(employee))

		expect(page).to have_text("January")

		expect(page).to have_text('Job successfully updated!')




	end
end