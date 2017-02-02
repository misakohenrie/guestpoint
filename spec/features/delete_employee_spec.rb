require "rails_helper"

describe "Deleting an employee" do

	it "destroys the employee and removes it from the list" do
		unit = Unit.create!(unit_attributes)
		employee = unit.employees.create!(employee_attributes)

		visit unit_employee_path(unit, employee)

		click_link 'Delete'

		expect(current_path).to eq(unit_employees_path(unit))
		expect(page).not_to have_text(employee.first_name)
		expect(page).to have_text("Employee successfully deleted!")
	end

end