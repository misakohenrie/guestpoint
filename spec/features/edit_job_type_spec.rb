require 'rails_helper'

describe "Editing a job type" do 

	it "updates and displays the new information" do
		unit = Unit.create!(unit_attributes)
		job_type = unit.job_types.create(job_type_attributes)

		visit unit_job_types_url(unit)

		click_link 'Edit'

		expect(current_path).to eq(edit_unit_job_type_path(unit,job_type))

		expect(find_field('Description').value).to eq(job_type.description)
	
		fill_in 'Description', with: "Updated description"

		click_button 'Update Job type'

		expect(current_path).to eq(unit_job_types_path(unit))

		expect(page).to have_text('Updated description')
		expect(page).to have_text('Job Type successfully updated!')
	end

	it "does not update if it's invalid" do
		unit = Unit.create!(unit_attributes)
		job_type = unit.job_types.create(job_type_attributes)

		visit edit_unit_job_type_url(unit,job_type)

		fill_in 'Description', with: " "

		click_button 'Update Job type'

		expect(page).to have_text('error')
	end
end