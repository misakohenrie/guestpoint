require 'rails_helper'

describe "Viewing a list of jobs" do 

	before do
		@unit = Unit.create!(unit_attributes)
  		@admin = @unit.employees.create!(employee_attributes(admin: true))
  		sign_in(@admin)
	end

	it "shows the jobs for the specific employee" do
		employee1 = @unit.employees.create!(employee_attributes(first_name: "Employee1",
																email: "employee1@example.com"))
		job_type1 = @unit.job_types.create!(job_type_attributes)
		job1 = employee1.jobs.create(job_attributes(job_type: job_type1))

		employee2 = @unit.employees.create!(employee_attributes(first_name: "Employee2",
																email: "employee2@example.com"))
		job_type2 = @unit.job_types.create!(job_type_attributes(description: "Busser", slug: "busser"))
		job2 = employee2.jobs.create(job_attributes(start_date: "2016-10-22", job_type: job_type2))

		visit employee_jobs_url(employee1)

		expect(page).to have_text(job1.start_date)

		expect(page).not_to have_text(job2.start_date)

	end
end
