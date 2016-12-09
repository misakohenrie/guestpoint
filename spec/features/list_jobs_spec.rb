require 'rails_helper'

describe "Viewing a list of jobs" do 

	it "shows the jobs for the specific employee" do
		employee1 = Employee.create(employee_attributes(first_name: "Frank"))
		job_type1 = JobType.create(job_type_attributes)
		job1 = employee1.jobs.create(job_attributes(job_type: job_type1))

		employee2 = Employee.create(employee_attributes(first_name: "Sally"))
		job_type2 = JobType.create(job_type_attributes(description: "Busser"))
		job2 = employee2.jobs.create(job_attributes(start_date: "2016-10-22", job_type: job_type2))

		visit employee_jobs_url(employee1)

		expect(page).to have_text(job1.start_date)

		expect(page).not_to have_text(job2.start_date)

	end
end
