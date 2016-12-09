require "rails_helper"

describe "Deleting an employee" do

	it "destroys the employee and removes it from the list" do
		employee = Employee.create(employee_attributes)

		visit employee_path(employee)

		click_link 'Delete'

		expect(current_path).to eq(employees_path)
		expect(page).not_to have_text(employee.first_name)
		expect(page).to have_text("Employee successfully deleted!")
	end

end