require 'rails_helper'

describe "Signing out" do

  it "removes the employee id from the session" do

  	unit = Unit.create!(unit_attributes)
    employee = unit.employees.create!(employee_attributes)

    sign_in(employee)

    click_link 'Sign Out'

    expect(page).to have_text("signed out")
    expect(page).not_to have_link('Sign Out')
    expect(page).to have_link('Sign In')
  end

end