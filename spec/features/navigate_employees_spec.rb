require 'rails_helper'

describe "Navigating employees" do

	it "allows navigation from detail page to listing page" do
		employee = Employee.create(employee_attributes)

		visit employee_url(employee)

		click_link "All Employees"

		expect(current_path).to eq(employees_path)
	end

	it "allows navigation from listing page to detail page" do
		employee = Employee.create(employee_attributes)

		visit employees_url

		click_link employee.first_name

		expect(current_path).to eq(employee_path(employee))
	end
	
end