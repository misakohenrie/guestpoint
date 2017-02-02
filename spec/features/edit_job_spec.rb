require 'rails_helper'

describe "Editing a job" do 

	it "updates the job and displays the new information" do 
		unit = Unit.create!(unit_attributes)
		employee = unit.employees.create(employee_attributes)
		job_type = unit.job_types.create(job_type_attributes)
		job = employee.jobs.create(job_attributes(job_type: job_type, start_date:"2010-12-12"))
		
		visit unit_employee_jobs_url(unit,employee)

		click_link "Edit"

		expect(current_path).to eq(edit_unit_employee_job_path(unit,employee, job))

		expect(find_field("Start date").value).to eq("2010-12-12")

		fill_in 'Start date', with: "2014-01-11"

		click_button 'Update Job'

		expect(current_path).to eq(unit_employee_jobs_path(unit,employee))

		expect(page).to have_text("January")

		expect(page).to have_text('Job successfully updated!')




	end
end