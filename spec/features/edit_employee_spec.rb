require 'rails_helper'

describe "Editing an employee" do

	before do
		@unit = Unit.create!(unit_attributes)
  		@admin = @unit.employees.create!(employee_attributes(admin: true))
  		sign_in(@admin)
	end

	it "updates the employee record and shows the updated details" do
		employee = @unit.employees.create!(employee_attributes(first_name: "New",
																email: "new@example.com"))
		
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
		employee = @unit.employees.create!(employee_attributes(first_name: "New",
																email: "new@example.com"))
		
		visit edit_employee_url(employee)

		fill_in 'First name', with: " "

		click_button 'Update Employee'

		expect(page).to have_text('error')
	end
end	