require 'rails_helper'

describe "Navigating employees" do

	before do
		@unit = Unit.create!(unit_attributes)
  		@admin = @unit.employees.create!(employee_attributes(admin: true))
  		sign_in(@admin)
	end

	it "allows navigation from detail page to listing page" do
		employee = @unit.employees.create!(employee_attributes(first_name: "New",
																email: "new@example.com"))
		
		visit employee_url(employee)

		click_link "All Employees"

		expect(current_path).to eq(unit_employees_path(@unit))
	end

	it "allows navigation from listing page to detail page" do
		employee = @unit.employees.create!(employee_attributes(first_name: "New",
																email: "new@example.com"))
		
		visit unit_employees_url(@unit)

		click_link "#{employee.first_name} #{employee.middle_name} #{employee.last_name}"

		expect(current_path).to eq(employee_path(employee))
	end
	
end