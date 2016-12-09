require 'rails_helper'

describe "Creating a new employee" do

	it "saves the new employee and shows the details" do
		visit employees_url

		click_link 'Add New Employee'

		expect(current_path).to eq(new_employee_path)

		fill_in 'First name', with: "Frank"
		fill_in 'Middle name', with: "William"
		fill_in 'Last name', with: "Abagnale"
		fill_in 'Address1', with: "1234 Broadway St."
		fill_in 'Address2', with: "Apt. 12"
		fill_in 'City', with: "Salt Lake City"
		fill_in 'State', with: "UT"
		fill_in 'Zip', with: "84124"
		fill_in 'Pin', with: "456"
		fill_in 'Ssn', with: "546623587"
		fill_in 'Birthdate', with: "1989-03-25"
		fill_in	'Hire date', with: "2015-04-05"
		fill_in	'Termination date', with: "2015-08-15"
		fill_in	'Phone1', with: "801-654-3214"
		fill_in 'Phone2', with: "801-546-1245"
		fill_in 'Picture', with: "frank_abagnale.jpg"

		click_button 'Create Employee'

		expect(current_path).to eq(employee_path(Employee.last))

		expect(page).to have_text("Frank")
	end

	it "does not save the employee if it's invalid" do
		visit new_employee_url

		expect{
			click_button 'Create Employee'
			}.not_to change(Employee, :count)

		expect(current_path).to eq(employees_path)
		expect(page).to have_text('error')
	end
end