require 'rails_helper'

describe "An employee" do 

	it "requires a first name" do
		employee = Employee.new(first_name: "")

		employee.valid?

		expect(employee.errors[:first_name].any?).to eq(true)
	end

	it "requires an address" do
		employee = Employee.new(address1: "")

		employee.valid?

		expect(employee.errors[:address1].any?).to eq(true)
	end

	it "requires a city" do
		employee = Employee.new(city: "")

		employee.valid?

		expect(employee.errors[:city].any?).to eq(true)
	end

	it "requires a state" do
		employee = Employee.new(state: "")

		employee.valid?

		expect(employee.errors[:state].any?).to eq(true)
	end

	it "requires a zip code" do
		employee = Employee.new(zip: "")

		employee.valid?

		expect(employee.errors[:zip].any?).to eq(true)
	end

	it "requires a phone number" do
		employee = Employee.new(phone1: "")

		employee.valid?

		expect(employee.errors[:phone1].any?).to eq(true)
	end

	it "requires a ssn" do
		employee = Employee.new(ssn: "")

		employee.valid?

		expect(employee.errors[:ssn].any?).to eq(true)
	end

	it "requires a birthdate" do
		employee = Employee.new(birthdate: "")

		employee.valid?

		expect(employee.errors[:birthdate].any?).to eq(true)
	end

	it "requires a pin" do
		employee = Employee.new(pin: "")

		employee.valid?

		expect(employee.errors[:pin].any?).to eq(true)
	end

	it "requires a hire date" do
		employee = Employee.new(hire_date: "")

		employee.valid?

		expect(employee.errors[:hire_date].any?).to eq(true)
	end

	it "accepts properly formatted picture file names" do
		file_names = %w[e.png employee.png employee.jpg employee.gif EMPLOYEE.GIF]
		file_names.each do |file_name|
			employee = Employee.new(picture: file_name)
			employee.valid?
			expect(employee.errors[:picture].any?).to eq(false)
		end
	end

	it "rejects improperly formatted picture file names" do 
		file_names = %w[employee .jpg .png .gif employee.pdf employee.doc]
		file_names.each do |file_name|
			employee = Employee.new(picture: file_name)
			employee.valid?
			expect(employee.errors[:picture].any?).to eq(true)
		end
	end

	it "has job types" do
		employee = Employee.new(employee_attributes)
		job_type1 = JobType.new(job_type_attributes(description: "Server"))
		job_type2 = JobType.new(job_type_attributes(description: "Busser"))

		employee.jobs.new(job_type: job_type1)
		employee.jobs.new(job_type: job_type2)

		expect(employee.job_types).to include(job_type1)
		expect(employee.job_types).to include(job_type2)
	end

end