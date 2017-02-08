require "rails_helper"

describe "Deleting an employee" do

	before do
		@unit = Unit.create!(unit_attributes)
  		@admin = @unit.employees.create!(employee_attributes(admin: true))
  		sign_in(@admin)
	end

	it "destroys the employee and removes it from the list" do
		employee = @unit.employees.create(first_name: "Sally",
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
									email: "sally.smith@example.com",
									password: "sally",
									password_confirmation: "sally",
									picture: "placeholder.jpg")


		visit employee_path(employee)

		click_link 'Delete'

		expect(current_path).to eq(unit_employees_path(@unit))
		expect(page).not_to have_text(employee.first_name)
		expect(page).to have_text("Employee successfully deleted!")
	end

end