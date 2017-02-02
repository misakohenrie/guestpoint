require 'rails_helper'

describe "Editing an employee" do

	it "updates the employee record and shows the updated details" do
		unit = Unit.create!(unit_attributes)

		employee = unit.employees.create!(employee_attributes)

		visit unit_employee_url(unit,employee)

		click_link 'Edit'

		expect(current_path).to eq(edit_unit_employee_path(unit,employee))

		expect(find_field('First name').value).to eq(employee.first_name)
	
		fill_in 'First name', with: "Updated Employee Name"

		click_button 'Update Employee'

		expect(current_path).to eq(unit_employee_path(unit,employee))

		expect(page).to have_text('Updated Employee Name')

		expect(page).to have_text('Employee successfully updated!')

	end

	it "does not update the employee if it's invalid" do
		unit = Unit.create!(unit_attributes)
		employee = unit.employees.create!(employee_attributes)

		visit edit_unit_employee_url(unit,employee)

		fill_in 'First name', with: " "

		click_button 'Update Employee'

		expect(page).to have_text('error')
	end
end	