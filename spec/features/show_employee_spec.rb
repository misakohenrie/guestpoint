require 'rails_helper'

describe "Viewing an individual employee" do

	it "shows the details of the employee" do
		employee = Employee.create(employee_attributes)

		visit employee_url(employee)

		expect(page).to have_text(employee.first_name)
		expect(page).to have_text(employee.middle_name)
		expect(page).to have_text(employee.last_name)
		expect(page).to have_text(employee.address1)
		expect(page).to have_text(employee.city)
		expect(page).to have_text(employee.state)
		expect(page).to have_text(employee.zip)
		expect(page).to have_text(employee.pin)
		expect(page).to have_text(employee.ssn)
		expect(page).to have_text(employee.birthdate)
		expect(page).to have_text(employee.hire_date)		
		

	end

	it "has an SEO-friendly URL" do
	  employee = Employee.create!(employee_attributes(first_name: "Jack", last_name: "Frost"))

	  visit employee_url(employee)

	  expect(current_path).to eq("/employees/jack-frost")
	end

end