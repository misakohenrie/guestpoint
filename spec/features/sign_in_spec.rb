require 'rails_helper'

describe "Signing in" do
	
	it "prompts for an email and password" do
		visit root_url

	    click_link 'Sign In'

	    expect(current_path).to eq(signin_path)

	    expect(page).to have_field("Email")
	    expect(page).to have_field("Password")
  end

  it "signs in the employee if the email/password combination is valid" do
	  unit = Unit.create!(unit_attributes)
	  employee = unit.employees.create!(employee_attributes)

	  visit root_url

	  click_link 'Sign In'

	  fill_in "Email", with: employee.email
	  fill_in "Password", with: employee.password

	  click_button 'Sign In'  

	  expect(page).to have_text("Welcome back #{employee.first_name}!")

	  expect(page).to have_link(employee.first_name)
	  expect(page).not_to have_link('Sign In')
	  expect(page).to have_link('Sign Out')
	end

	it "does not sign in the employee if the email/password combination is invalid" do
	  unit = Unit.create!(unit_attributes)
	  employee = unit.employees.create!(employee_attributes)

	  visit root_url

	  click_link 'Sign In'

	  fill_in "Email", with: employee.email
	  fill_in "Password", with: "no match"

	  click_button 'Sign In'

	  expect(page).to have_text('Invalid')

	  expect(page).not_to have_link(employee.first_name)
	  expect(page).to have_link('Sign In')
	  expect(page).not_to have_link('Sign Out')
	end


	it "redirects to the intended page" do
		unit = Unit.create!(unit_attributes)
	  	employee = unit.employees.create!(employee_attributes)

	  	visit employee_url(employee)

	  	expect(current_path).to eq(signin_path)

	  	sign_in(employee)

	  	expect(current_path).to eq(employee_path(employee))
	end

end