require 'rails_helper'

describe "Creating a job" do
	
	it "saves and displays it on the employee page" do
		unit = Unit.create!(unit_attributes)
		employee = unit.employees.create(employee_attributes)
		job_type = unit.job_types.create(job_type_attributes)

		visit unit_employee_url(unit,employee)

		click_link 'Add Job'

		expect(current_path).to eq(new_unit_employee_job_path(unit, employee))

		select "Server", :from => "job[job_type_id]"
		fill_in "Start date", with: "2013-05-22"

		click_button 'Create Job'

		expect(current_path).to eq(unit_employee_jobs_path(unit, employee))

		expect(page).to have_text("2013")

		expect(page).to have_text("Job successfully created!")
	end

		
end