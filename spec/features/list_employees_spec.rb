require 'rails_helper'

describe "Viewing the list of employees"  do

	it "shows the employees" do
		employee1= Employee.create(employee_attributes)

		employee2= Employee.create(first_name: "Sally",
									middle_name: "Ann",
									last_name: "Smith",
									address1: "9874 Park Place",
									city: "Salt Lake City",
									state: "UT",
									zip: "84124",
									pin: "354",
									ssn: "654789321",
									birthdate: "1988-12-05",
									hire_date: "2013-07-20",
									termination_date: "2015-07-05",
									phone1: "801-654-1256",
									picture: "placeholder.jpg")

		visit employees_url

		expect(page).to have_text(employee1.first_name)
		expect(page).to have_text(employee2.first_name)

		expect(page).to have_text(employee1.phone1)
				

	end


end