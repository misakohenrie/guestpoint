require 'rails_helper'

describe "Viewing the list of employees"  do

	before do
		@unit = Unit.create!(unit_attributes)
  		@admin = @unit.employees.create!(employee_attributes(admin: true))
  		sign_in(@admin)
	end

	it "shows the employees" do
		employee1 = @unit.employees.create!(employee_attributes(first_name: "Employee1",
																email: "employee1@example.com"))
		
		employee2 = @unit.employees.create!(employee_attributes(first_name: "Employee2",
																email: "employee2@example.com"))

		visit unit_employees_url(@unit)

		expect(page).to have_text(employee1.first_name)
		expect(page).to have_text(employee2.first_name)

		expect(page).to have_text(employee1.phone1)
				

	end


end