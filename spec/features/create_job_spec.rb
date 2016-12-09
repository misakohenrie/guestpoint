require 'rails_helper'

describe "Creating a job" do
	
	it "saves and displays it on the employee page" do
		employee = Employee.create(employee_attributes)
		job_type = JobType.create(job_type_attributes)

		visit employee_url(employee)

		click_link 'Add Job'

		expect(current_path).to eq(new_employee_job_path(employee))

		select "Server", :from => "job[job_type_id]"
		fill_in "Start date", with: "2013-05-22"

		click_button 'Create Job'

		expect(current_path).to eq(employee_jobs_path(employee))

		expect(page).to have_text("2013")

		expect(page).to have_text("Job successfully created!")
	end

		
end