require 'rails_helper'

describe "A job type" do

	it "requires a description" do
		job_type = JobType.new(description: "")

		job_type.valid?

		expect(job_type.errors[:description].any?).to eq(true)
	end

	it "has employees" do
		job_type = JobType.new(job_type_attributes)
		employee1 = Employee.new(employee_attributes(first_name: "Frank"))
		employee2 = Employee.new(employee_attributes(first_name: "Sally"))

		job_type.jobs.new(employee: employee1)
		job_type.jobs.new(employee: employee2)

		expect(job_type.employees).to include(employee1)
		expect(job_type.employees).to include(employee2)
	end

end