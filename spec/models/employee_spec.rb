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

	it "requires an email" do
	    employee = Employee.new(email: "")

	    employee.valid?

	    expect(employee.errors[:email].any?).to eq(true)
	end

	  it "accepts properly formatted email addresses" do
	    emails = %w[employee@example.com first.last@example.com]
	    emails.each do |email|
	      employee = Employee.new(email: email)
	      employee.valid?
	      expect(employee.errors[:email].any?).to eq(false)
	    end
	  end

	  it "rejects improperly formatted email addresses" do
	    emails = %w[@ employee@ @example.com]
	    emails.each do |email|
	      employee = Employee.new(email: email)
	      employee.valid?
	      expect(employee.errors[:email].any?).to eq(true)
	    end
	  end

	  it "requires a unique, case insensitive email address" do
	  	unit = Unit.create!(unit_attributes)
	    employee1 = unit.employees.create!(employee_attributes)

	    employee2 = unit.employees.new(email: employee1.email.upcase)
	    employee2.valid?
	    expect(employee2.errors[:email].first).to eq("has already been taken")
	  end

	  it "requires a password" do
	    employee = Employee.new(password: "")

	    employee.valid?

	    expect(employee.errors[:password].any?).to eq(true)
	  end

	  it "requires a password confirmation" do
	    employee = Employee.new(password: "work", password_confirmation: "")

	    employee.valid?

	    expect(employee.errors[:password_confirmation].any?).to eq(true)
	  end

	  it "requires the password to match the password confirmation" do
	    employee = Employee.new(password: "work", password_confirmation: "nomatch")

	    employee.valid?

	    expect(employee.errors[:password_confirmation].first).to eq("doesn't match Password")
	  end

	  it "requires a password and matching password confirmation when creating" do
	    unit = Unit.create!(unit_attributes)
	    employee = unit.employees.create!(employee_attributes(password: "work", password_confirmation: "work"))

	    expect(employee.valid?).to eq(true)
	  end

	  it "does not require a password when updating" do
	  	unit = Unit.create!(unit_attributes)
	    employee = unit.employees.create!(employee_attributes)

	    employee.password = ""

	    expect(employee.valid?).to eq(true)
	  end

	  it "automatically encrypts the password into the password_digest attribute" do
	    employee = Employee.new(password: "work")

		expect(employee.password_digest.present?).to eq(true)
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