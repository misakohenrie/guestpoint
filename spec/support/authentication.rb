def sign_in(employee)
  visit signin_url
  fill_in "Email", with: employee.email
  fill_in "Password", with: employee.password
  click_button "Sign In"
end