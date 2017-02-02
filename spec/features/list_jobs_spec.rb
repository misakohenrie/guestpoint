require 'rails_helper'

describe "Viewing a list of jobs" do 

	it "shows the jobs for the specific employee" do
		unit = Unit.create!(unit_attributes)
		employee1 = unit.employees.create!(employee_attributes(first_name: "Frank"))
		job_type1 = unit.job_types.create!(job_type_attributes)
		job1 = employee1.jobs.create(job_attributes(job_type: job_type1))

		employee2 = unit.employees.create!(employee_attributes(first_name: "Sally", slug: "sally"))
		job_type2 = unit.job_types.create!(job_type_attributes(description: "Busser", slug: "busser"))
		job2 = employee2.jobs.create(job_attributes(start_date: "2016-10-22", job_type: job_type2))

		visit unit_employee_jobs_url(unit,employee1)

		expect(page).to have_text(job1.start_date)

		expect(page).not_to have_text(job2.start_date)

	end
end
