require 'rails_helper'

describe "Editing an employee" do

	it "updates the employee record and shows the updated details" do

		employee = Employee.create(employee_attributes)

		visit employee_url(employee)

		click_link 'Edit'

		expect(current_path).to eq(edit_employee_path(employee))

		expect(find_field('First name').value).to eq(employee.first_name)
	
		fill_in 'First name', with: "Updated Employee Name"

		click_button 'Update Employee'

		expect(current_path).to eq(employee_path(employee))

		expect(page).to have_text('Updated Employee Name')

		expect(page).to have_text('Employee successfully updated!')

	end

	it "does not update the employee if it's invalid" do
		employee = Employee.create(employee_attributes)

		visit edit_employee_url(employee)

		fill_in 'First name', with: " "

		click_button 'Update Employee'

		expect(page).to have_text('error')
	end
end	