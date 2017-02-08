require 'rails_helper'

describe "Creating a new employee" do
	before do
		@unit = Unit.create!(unit_attributes)
  		@admin = @unit.employees.create!(employee_attributes(admin: true))
  		sign_in(@admin)
	end

	it "saves the new employee and shows the details" do

		visit unit_employees_url(@unit)

		click_link 'Add New Employee'

		expect(current_path).to eq(new_unit_employee_path(@unit))

		fill_in 'First name', with: "Sally"
		fill_in 'Middle name', with: "Ann"
		fill_in 'Last name', with: "Smith"
		fill_in 'Address1', with: "9874 Park Place"
		fill_in 'City', with: "Salt Lake City"
		fill_in 'State', with: "UT"
		fill_in 'Zip', with: "84124"
		fill_in 'Pin', with: "354"
		fill_in 'Ssn', with: "654789321"
		fill_in 'Birthdate', with: "1988-12-05"
		fill_in	'Hire date', with: "2013-07-20"
		fill_in	'Termination date', with: "2015-07-05"
		fill_in	'Phone1', with: "(801)-654-1256"
		fill_in 'Email', with: "sally.smith@example.com"
		fill_in 'Password', with: "sweets"
		fill_in 'Confirm Password', with: "sweets"
		fill_in 'Picture', with: "placeholder.jpg"

		click_button 'Create Employee'

		expect(current_path).to eq(employee_path(Employee.last))

		expect(page).to have_text("Frank")
	end


	it "does not save the employee if it's invalid" do

		visit new_unit_employee_url(@unit)

		expect{
			click_button 'Create Employee'
			}.not_to change(Employee, :count)

		expect(current_path).to eq(unit_employees_path(@unit))
		expect(page).to have_text('error')
	end
end