require 'rails_helper'

describe "Navigating employees" do

	it "allows navigation from detail page to listing page" do
		unit = Unit.create!(unit_attributes)
		employee = unit.employees.create(employee_attributes)

		visit unit_employee_url(unit,employee)

		click_link "All Employees"

		expect(current_path).to eq(unit_employees_path(unit))
	end

	it "allows navigation from listing page to detail page" do
		unit = Unit.create!(unit_attributes)
		employee = unit.employees.create(employee_attributes)

		visit unit_employees_url(unit)

		click_link employee.first_name

		expect(current_path).to eq(unit_employee_path(unit,employee))
	end
	
end